import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shop_app/data/repositories/repositories_authentication/authentication_repositories.dart';
import 'package:shop_app/data/repositories/user/user_repositories.dart';
import 'package:shop_app/features/authentication/screens/signup_widget/widget/verify_email.dart';
import 'package:shop_app/features/personalization/models/user_modle.dart';
import 'package:shop_app/utills/constants/image_settings.dart';
import 'package:shop_app/utills/network/network_manager.dart';
import 'package:shop_app/utills/popups/full_screen_loader.dart';
import 'package:shop_app/utills/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// --SIGNUP
  Future<void> signup() async {
    try {
      //Start loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information ', TImages.onBoardingImage1);
      //check internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept privacy policy',
            message:
            'In order to create account, you have to read and accept Privacy Policy & Terms of Use.');
        return;
      }
      // Register User in Firebase Authentication & save User data
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save Authentication User Data in the firebase  FireStore
      if (kDebugMode) {
        print("FirName:$firstName");
      }
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: userName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      TFullScreenLoader.stopLoading();
      //Show success message
      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your Account has been created ! Verify email to continue');
      //move to Verify Email Screen
      Get.to(()=> VerifyEmailScreen(email: email.text.trim(),));


      //Remove Loader
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: 'On snap', message: e.toString());
    }
  }
}
