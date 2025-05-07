import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/features/authentication/screens/signup_widget/widget/form_signuo.dart';
import 'package:shop_app/utills/constants/size.dart';
import 'package:shop_app/utills/constants/text_strings.dart';

import '../../../../common/widget_icon_styles/form_dividor.dart';
import '../../../../common/widget_icon_styles/social_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //title
              Text(
                TTexts.signUpTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),


              const SizedBox(
                height: TSize.spaceBtwItems,
              ),
              //form
              const TSignUPForm(),
              const SizedBox(
                height: TSize.spaceBtwSections,
              ),

              //Divider
              TDividorLogin(
                dividorText: TTexts.orSignUPWith.capitalize!,
              ),
              const SizedBox(
                height: TSize.spaceBtwItems,
              ),

              //Social button
              const TSocialMediaIcon()
            ],
          ),
        ),
      ),
    );
  }
}


