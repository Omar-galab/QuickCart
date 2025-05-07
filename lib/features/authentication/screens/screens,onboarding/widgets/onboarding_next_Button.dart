import 'package:flutter/material.dart';
import 'package:shop_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:shop_app/utills/constants/size.dart';
import 'package:shop_app/utills/device/device_utility.dart';
import 'package:shop_app/utills/helpers/helper_function.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_app/utills/constants/colores.dart';

class OnBoardNextButton extends StatelessWidget {
  const OnBoardNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelper.isDarkMode(context);
    return Positioned(
      right: TSize.defultSpace,
      bottom: TDeviceUtilite.getBottomNavigationBarHight(),
      child: ElevatedButton(
        onPressed: () => OnBoardingScrenController.Instance.nextPage(),
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: dark ? TColore.primary : Colors.black),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}
