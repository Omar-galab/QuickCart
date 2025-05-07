import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_app/utills/constants/size.dart';
import 'package:shop_app/utills/helpers/helper_function.dart';

class OnBordingPage extends StatelessWidget {
  const OnBordingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });
  final String image, title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSize.defultSpace),
      child: Column(
        children: [
          Lottie.asset(
            image,
            height: THelper.screenHight() * 0.6,
            width: THelper.screenWidth() * 0.8,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: TSize.spaceBtwFields,
          ),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
