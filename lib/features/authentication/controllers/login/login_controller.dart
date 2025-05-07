import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/data/repositories/repositories_authentication/authentication_repositories.dart';
import 'package:shop_app/features/personalization/controllers/user_controller.dart';
import 'package:shop_app/utills/constants/image_settings.dart';
import 'package:shop_app/utills/network/network_manager.dart';
import 'package:shop_app/utills/popups/full_screen_loader.dart';
import 'package:shop_app/utills/popups/loaders.dart';

class LoginController extends GetxController {
  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState>loginFormKey = GlobalKey<FormState>();
  final userController =Get.put(UserController());

  @override
  void onInit(){
    email.text=localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text =localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }
  ///--Email and Password Sig
  Future<void> emailAndPasswordSignIn() async {
    try {
      //Start loading
      TFullScreenLoader.openLoadingDialog(
          'Logging you in ....', TImages.onBoardingImage1);
      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //Form validate
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //Save data if remember me
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
      // Login user Using Email & Password Authentication
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //Remove loader
      TFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();

    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'On Snap' ,message: e.toString());
    }
  }

  Future<void>googleSignIn()async{
     try{
       //Start loading
       TFullScreenLoader.openLoadingDialog(
           'Logging you in ....', TImages.onBoardingImage1);

       final isConnected = await NetworkManager.instance.isConnected();
       if (!isConnected) {
         TFullScreenLoader.stopLoading();
         return;
       }
       //Google Authentication
       final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();
       //save user Record
       await UserController.instance.saveUserRecord(userCredentials);
        //remove Loaders
       TFullScreenLoader.stopLoading();
       //Redirect
       AuthenticationRepository.instance.screenRedirect();

     }catch(e){
       TLoaders.errorSnackBar(title: 'Error snap' ,message: e.toString());
     }
  }
}