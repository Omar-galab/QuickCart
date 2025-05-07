import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:shop_app/features/authentication/screens/screens,onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:shop_app/features/authentication/screens/screens,onboarding/widgets/onboarding_pages.dart';
import 'package:shop_app/features/authentication/screens/screens,onboarding/widgets/onboarding_skip.dart';
import 'package:shop_app/features/authentication/screens/screens,onboarding/widgets/onboarding_next_Button.dart';
import 'package:shop_app/utills/constants/image_settings.dart';

import 'package:shop_app/utills/constants/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingScrenController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBordingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBordingTitle1,
                subTitle: TTexts.onBordingSubTitle1,
              ),
              OnBordingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBordingTitle2,
                subTitle: TTexts.onBordingSubTitle2,
              ),
              OnBordingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBordingTitle3,
                subTitle: TTexts.onBordingSubTitle3,
              ),
            ],
          ),
          //inboardSkip
          const OnBoardingSkip(),
          //navigationsomth indecator
          const OnBoardingDotNavigation(),
          //circlur button
          const OnBoardNextButton(),
        ],
      ),
    );
  }
}




// ignore: camel_case_types


