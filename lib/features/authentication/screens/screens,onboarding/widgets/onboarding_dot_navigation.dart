import 'package:flutter/material.dart';
import 'package:shop_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:shop_app/utills/constants/colores.dart';
import 'package:shop_app/utills/constants/size.dart';
import 'package:shop_app/utills/device/device_utility.dart';
import 'package:shop_app/utills/helpers/helper_function.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingScrenController.Instance;
    final dark = THelper.isDarkMode(context);
    return Positioned(
      bottom: TDeviceUtilite.getBottomNavigationBarHight() + 25,
      left: TSize.defultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.datNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(
            activeDotColor: dark ? TColore.light : TColore.dark, dotHeight: 6),
      ),
    );
  }
}
