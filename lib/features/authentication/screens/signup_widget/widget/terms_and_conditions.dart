import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/features/authentication/controllers/signup/signup_controller.dart';

import '../../../../../utills/constants/colores.dart';
import '../../../../../utills/constants/size.dart';
import '../../../../../utills/constants/text_strings.dart';
import '../../../../../utills/helpers/helper_function.dart';

class TTermsAndConditionCheckbox extends StatelessWidget {
  const TTermsAndConditionCheckbox({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = THelper.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            ()=> Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value,
            ),
          ),
        ),
        const SizedBox(
          width: TSize.spaceBtwItems,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: '${TTexts.iAgreeTo} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
            text: '${TTexts.privacyPolicy} ',
            style: Theme.of(context).textTheme.bodyMedium!.apply(
              color: dark ? TColore.white : TColore.primary,
              decoration: TextDecoration.underline,
              decorationColor:
              dark ? TColore.white :
              TColore.primary,
            ),
          ),
          TextSpan(
              text: '${TTexts.and} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
            text: '${TTexts.termOfUse} ',
            style: Theme.of(context).textTheme.bodyMedium!.apply(
              color: dark ? TColore.white : TColore.primary,
              decoration: TextDecoration.underline,
              decorationColor:
              dark ? TColore.white : TColore.primary,
            ),
          ),
        ]))
      ],
    );
  }
}