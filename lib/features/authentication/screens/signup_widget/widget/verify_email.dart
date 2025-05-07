import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/data/repositories/repositories_authentication/authentication_repositories.dart';
import 'package:shop_app/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:shop_app/utills/constants/image_settings.dart';
import 'package:shop_app/utills/constants/size.dart';
import 'package:shop_app/utills/constants/text_strings.dart';

import '../../../../../utills/helpers/helper_function.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});
  final String? email ;
  @override
  Widget build(BuildContext context) {
    final controller =Get.put( VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository().initialized,
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defultSpace),
          child: Column(
            children: [
              Image(
                height: THelper.screenHight() * 0.35,
                width: THelper.screenWidth() * 0.6,
                image: const AssetImage(TImages.deliverdEmailVerifaction),
              ),
              const SizedBox(
                height: TSize.spaceBtwSections,
              ),
              Text(
                TTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSize.spaceBtwSections,
              ),
              //Title && subtitle
              Text(
                email ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSize.spaceBtwSections,
              ),
              Text(
                TTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSize.spaceBtwSections,
              ),

              //Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.checkEmailVerificationStats(),
                    child: const Text(TTexts.tContinue)),
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: ()=> controller.sendEmailVerification(), child: const Text(TTexts.resendEmail)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
