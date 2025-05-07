import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/data/repositories/user/user_repositories.dart';
import 'package:shop_app/features/personalization/controllers/user_controller.dart';
import 'package:shop_app/features/personalization/screens/profile/profile.dart';
import 'package:shop_app/utills/constants/image_settings.dart';
import 'package:shop_app/utills/network/network_manager.dart';
import 'package:shop_app/utills/popups/full_screen_loader.dart';
import 'package:shop_app/utills/popups/loaders.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState>updateUserNameFormKey = GlobalKey<FormState>();


  /// init userData when home screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  ///Fetch User record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'we are updating your information', TImages.onBoardingImage1);

      //check for connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //form validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //  update user first && last name in firebase fireStore
      Map<String, dynamic>name = {
        'firstName': firstName.text.trim(),
        'lastName': lastName.text.trim()
      };
      await userRepository.updateSingleUserData(name);
      // update rx user value
      userController.user.value.firstName=firstName.text.trim();
      userController.user.value.lastName=lastName.text.trim();

      // remove loader
      TFullScreenLoader.stopLoading();

      //show success message
      TLoaders.successSnackBar(
          title: 'Congratulation', message: 'Your name has been updated .');
      //move to previous screen
      Get.off(()=> const ProfileScreen());

    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Shop' ,message: e.toString());
      print(e.toString());
    }
  }


}