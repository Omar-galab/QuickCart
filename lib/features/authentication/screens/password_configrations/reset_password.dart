import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:shop_app/features/authentication/screens/loggin/login.dart';
import 'package:shop_app/utills/constants/image_settings.dart';
import 'package:shop_app/utills/constants/size.dart';
import 'package:shop_app/utills/constants/text_strings.dart';

import '../../../../utills/helpers/helper_function.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defultSpace),
          child: Column(children: [
            Image(
              height: THelper.screenHight() * 0.35,
              width: THelper.screenWidth() * 0.6,
              image:  const AssetImage(TImages.deliverdEmailVerifaction),
            ),
            const SizedBox(
              height: TSize.spaceBtwSections,
            ),
            Text(
              TTexts.changeYourPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: TSize.spaceBtwSections,
            ),
            //Title && subtitle

            Text(
              TTexts.changeYourPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: TSize.spaceBtwSections,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: ()=>Get.offAll(()=>const LoginScreen()), child: const Text(TTexts.done)),
            ),
            const SizedBox(
              height: TSize.spaceBtwItems,
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                  onPressed: ()=>ForgetPasswordController.instance.resetPasswordResetEmail(email), child: const Text(TTexts.resendEmail)),
            ),
          ],),
        ),
      ),
    );
  }
}
