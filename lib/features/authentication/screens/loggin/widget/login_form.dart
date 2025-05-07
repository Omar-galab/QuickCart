import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_app/features/authentication/screens/password_configrations/forget_password.dart';
import 'package:shop_app/features/authentication/screens/signup_widget/signup.dart';
import 'package:shop_app/utills/constants/size.dart';
import 'package:shop_app/utills/constants/text_strings.dart';
import 'package:shop_app/utills/validators/validtion.dart';

import '../../../controllers/login/login_controller.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSize.spaceBtwSections),
        child: Column(
          children: [
            //email
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TTexts.email),
            ),
            const SizedBox(height: TSize.spaceBtwFields),
            //Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => TValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                expands: false,
                decoration: InputDecoration(
                    labelText: TTexts.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye),
                    )),
              ),
            ),
            const SizedBox(height: TSize.spaceBtwFields / 2),

            //Remember me and forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///Remember me
                Row(
                  children: [
                    Obx(() => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value =
                            !controller.rememberMe.value)),
                    const Text(TTexts.rememberMe)
                  ],
                ),

                //Forget Password
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPasswordScreen()),
                  child: const Text(TTexts.forgetPassword),
                ),
              ],
            ),

            const SizedBox(
              height: TSize.spaceBtwSections,
            ),
            //sign in button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.emailAndPasswordSignIn(),
                  child: const Text(TTexts.signIn),
                )),
            const SizedBox(
              height: TSize.spaceBtwItems,
            ),
            //Creat Account button
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Get.to(() => const SignUpScreen()),
                  child: const Text(TTexts.creatAccount),
                )),
          ],
        ),
      ),
    );
  }
}
