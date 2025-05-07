import 'package:flutter/material.dart';
import 'package:shop_app/common/styles/spacing_styles.dart';

import '../../../utills/constants/size.dart';
import '../../../utills/constants/text_strings.dart';
import '../../../utills/helpers/helper_function.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.onpressed});

  final String image, title, subtitle;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHight * 2,
          child: Column(
            children: [
              //Image
              Image(
                height: THelper.screenHight() * 0.35,
                width: THelper.screenWidth() * 0.6,
                image:  AssetImage(image),
              ),
              const SizedBox(
                height: TSize.spaceBtwSections,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSize.spaceBtwSections,
              ),
              //Title && subtitle

              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSize.spaceBtwSections,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: onpressed, child: const Text(TTexts.tContinue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
