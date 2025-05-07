import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/data/repositories/repositories_authentication/authentication_repositories.dart';
import 'package:shop_app/features/authentication/screens/password_configrations/reset_password.dart';
import 'package:shop_app/utills/constants/image_settings.dart';
import 'package:shop_app/utills/network/network_manager.dart';
import 'package:shop_app/utills/popups/full_screen_loader.dart';
import 'package:shop_app/utills/popups/loaders.dart';
class ForgetPasswordController extends GetxController{

  static ForgetPasswordController get instance =>Get.find();

  //Variable
final email=TextEditingController();
GlobalKey<FormState>forgetPasswordFormKey=GlobalKey<FormState>();

//send reset password email
sendPasswordResetEmail()async{
  try{
    TFullScreenLoader.openLoadingDialog('Processing your request ', TImages.onBoardingImage2);
    //check internet
    final isConnected =await NetworkManager.instance.isConnected();
    if(!isConnected){
      TFullScreenLoader.stopLoading();
      return;
    }
    //Form validation
    if(!forgetPasswordFormKey.currentState!.validate()){
      TFullScreenLoader.stopLoading();
      return;
    }
    //send email reset
    await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());
    //Remove loader
    TFullScreenLoader.stopLoading();
    //show SuccessScreen
    TLoaders.successSnackBar(title: 'Email sent' ,message: 'Email Link sent to reset your password'.tr);
    //Redirect
    Get.to(()=>ResetPasswordScreen(email :email.text.trim()));
  }catch (e){
    TFullScreenLoader.stopLoading();
    TLoaders.errorSnackBar(title: 'Error ',message: e.toString());
  }
}
  resetPasswordResetEmail(String email)async{
    try{
      TFullScreenLoader.openLoadingDialog('Processing your request ', TImages.onBoardingImage2);
      //check internet
      final isConnected =await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      //send email reset
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);
      //Remove loader
      TFullScreenLoader.stopLoading();
      //show SuccessScreen
      TLoaders.successSnackBar(title: 'Email sent' ,message: 'Email Link sent to reset your password'.tr);

    }catch (e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Error ',message: e.toString());
    }
  }
}