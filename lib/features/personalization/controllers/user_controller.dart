import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/data/repositories/repositories_authentication/authentication_repositories.dart';
import 'package:shop_app/data/repositories/user/user_repositories.dart';
import 'package:shop_app/features/personalization/models/user_modle.dart';
import 'package:shop_app/features/personalization/screens/profile/widget/re_authenticate_user_login_form.dart';
import 'package:shop_app/utills/constants/size.dart';
import 'package:shop_app/utills/popups/full_screen_loader.dart';
import 'package:shop_app/utills/popups/loaders.dart';

import '../../../utills/constants/image_settings.dart';
import '../../../utills/network/network_manager.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final hidePassword = false.obs;
  final imageUploading=false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  final GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  //Save user record form any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      // Refresh User record
      await fetchUserRecord();

      //if no record already stored
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          //convert name to first and last name
          final nameParts =
              UserModel.nameParse(userCredential.user!.displayName ?? '');
          final userName = UserModel.generateUsername(nameParts[0],
              nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '');
          //map data
          final user = UserModel(
              id: userCredential.user!.uid,
              firstName: nameParts[0],
              lastName:
                  nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
              username: userName,
              email: userCredential.user!.email ?? '',
              phoneNumber: userCredential.user!.phoneNumber ?? '',
              profilePicture: userCredential.user!.photoURL ?? '');
          //save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Data not save',
          message:
              'Something went wrong while saving your information ,You can re-save your data in your Profile. ');
    }
  }

  ///Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(TSize.sm),
        title: 'DeleteAccount',
        middleText: 'Are you sure you want to delete your account permanently?'
            ' This action is not reversible and all of your data will be removed permanently',
        confirm: ElevatedButton(
            onPressed: () async => deleteUserAccount(),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                side: const BorderSide(color: Colors.red)),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: TSize.lg),
              child: Text('Delete'),
            )),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text('Cancel')));
  }

  ///Delete user account
  void deleteUserAccount() async {
    try {
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // Re verify Auth Email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Error', message: e.toString());
    }
  }

  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      //TFullScreenLoader.openLoadingDialog('Processing', TImages.promoBanner1);
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information ', TImages.onBoardingImage1);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Validate Form
      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Re-authenticate and Delete Account
      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
        verifyEmail.text.trim(),
        verifyPassword.text.trim(),
      );
      await AuthenticationRepository.instance.deleteAccount();

      // TFullScreenLoader.stopLoading();
      // Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  uploadUserProfilePicture() async {
    try{
    final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512);
    if(image != null ) {
      imageUploading.value=true;
      //upload image
      final imageUrl = await userRepository.uploadImage(
          'Users/Images/Profile/', image);
      //Update user image record
      Map<String, dynamic> json = {'profilePicture': imageUrl};
      await userRepository.updateSingleUserData(json);
      user.value.profilePicture = imageUrl;
      if (kDebugMode) {
        print('IMAGE-----------------$imageUrl');
      }
      user.refresh();
      TLoaders.successSnackBar(title: 'Congratulation' ,message: 'Your profile image hase been updated');
    }
    }catch (e){
      TLoaders.errorSnackBar(title: 'Error' ,message: 'something went wrong :$e');
    }finally{
      imageUploading.value=false;
    }
  }
}
