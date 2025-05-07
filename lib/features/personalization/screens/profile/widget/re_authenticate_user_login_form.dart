import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_app/common/widgets/appbar/appbar.dart';
import 'package:shop_app/features/personalization/controllers/user_controller.dart';
import 'package:shop_app/utills/constants/size.dart';
import 'package:shop_app/utills/constants/text_strings.dart';
import 'package:shop_app/utills/validators/validtion.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Re-Authenticate User'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defultSpace),
          child: Form(
            key: controller.reAuthFormKey,
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Email
              TextFormField(
                controller: controller.verifyEmail,
                validator: TValidator.validateEmail,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: TTexts.email),
              ),
              const SizedBox(
                height: TSize.spaceBtwSections,
              ),
              Obx(
                    () => TextFormField(
                  controller: controller.verifyPassword,
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
              const SizedBox(height: TSize.spaceBtwSections,),
              //Login Button
               SizedBox(width: double.infinity,child: ElevatedButton(onPressed: ()=>controller.reAuthenticateEmailAndPasswordUser(), child: const Text('Verify')),)
            ],
          )),
        ),
      ),
    );
  }
}
