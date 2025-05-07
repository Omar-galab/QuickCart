import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/common/styles/spacing_styles.dart';
import 'package:shop_app/common/widget_icon_styles/form_dividor.dart';
import 'package:shop_app/common/widget_icon_styles/social_button.dart';
import 'package:shop_app/features/authentication/screens/loggin/widget/login_form.dart';
import 'package:shop_app/features/authentication/screens/loggin/widget/login_header.dart';
import 'package:shop_app/utills/constants/size.dart';
import 'package:shop_app/utills/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: TSpacingStyles.paddingWithAppBarHight / 2,
        child: Column(
          children: [
            //logo ,title ,subtitle
            const TLogenHeader(),
            //form
            const TLoginForm(),

            //Dividor
            TDividorLogin(
              dividorText: TTexts.orSignInWith.capitalize!,
            ),
            const SizedBox(
              height: TSize.spaceBtwItems,
            ),
            const TSocialMediaIcon()
          ],
        ),
      ),
    ));
  }
}
