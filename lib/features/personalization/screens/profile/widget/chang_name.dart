import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_app/common/widgets/appbar/appbar.dart';
import 'package:shop_app/features/personalization/controllers/update_name_controller.dart';
import 'package:shop_app/utills/constants/size.dart';
import 'package:shop_app/utills/constants/text_strings.dart';
import 'package:shop_app/utills/validators/validtion.dart';

class ChaneName extends StatelessWidget {
  const ChaneName({super.key});

  @override
  Widget build(BuildContext context) {
  final controller =Get.put(UpdateNameController());
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Chane Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSize.defultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Use real name for easy verification.This name will in several pages',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: TSize.spaceBtwSections,
            ),
            Form(
              key: controller.updateUserNameFormKey,
                child: Column(
              children: [
                TextFormField(
                  controller: controller.firstName,
                  validator: (value)=>TValidator.validateEmptyText('First name', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: TTexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
                const SizedBox(
                  height: TSize.spaceBtwSections,
                ),
                TextFormField(
                  controller: controller.lastName,
                  validator: (value)=>TValidator.validateEmptyText('Last name', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: TTexts.lastName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
                const SizedBox(height: TSize.spaceBtwSections,),
                SizedBox(width: double.infinity,child: ElevatedButton(onPressed: ()=>controller.updateUserName(),child: const Text('Save'),),)
              ],
            ))
          ],
        ),
      ),
    );
  }
}
