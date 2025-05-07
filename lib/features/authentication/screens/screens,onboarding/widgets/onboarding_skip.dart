import 'package:flutter/material.dart';
import 'package:shop_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:shop_app/utills/constants/size.dart';
import 'package:shop_app/utills/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtilite.getAppBarHeight(),
      right: TSize.defultSpace,
      child: TextButton(
        onPressed: () => OnBoardingScrenController.Instance.skipPage(),
        child: const Text('Skip'),
      ),
    );
  }
}
