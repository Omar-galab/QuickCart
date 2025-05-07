import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_app/common/widgets/appbar/appbar.dart';
import 'package:shop_app/common/widgets/images/circular_image.dart';
import 'package:shop_app/common/widgets/text/section_heading.dart';
import 'package:shop_app/features/personalization/controllers/user_controller.dart';
import 'package:shop_app/features/personalization/screens/profile/widget/chang_name.dart';
import 'package:shop_app/features/personalization/screens/profile/widget/profile_menu.dart';
import 'package:shop_app/utills/constants/image_settings.dart';
import 'package:shop_app/utills/constants/size.dart';
import 'package:shop_app/common/widgets/shimmers/shammer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),

      ///---BOdy
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      if (kDebugMode) {
                        print('NEtwork--------------------$networkImage');
                      }
                      final image =
                          networkImage.isNotEmpty ? networkImage : TImages.user;

                      return controller.imageUploading.value
                          ? TShimmerEffect(
                              width: 80,
                              height: 80,
                              radius: 80,
                            )
                          : TCircularIMage(
                              image: image,
                              width: 80,
                              height: 80,
                              padding: 0,
                              isNetworkIMage: networkImage.isNotEmpty,
                            );
                    }),
                    TextButton(
                        child: const Text('Change your profile picture'),
                        onPressed: () => controller.uploadUserProfilePicture()),
                  ],
                ),
              ),
              const SizedBox(
                height: TSize.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: TSize.spaceBtwItems,
              ),
              const TSectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSize.spaceBtwItems,
              ),
              TProfileMenu(
                title: 'Name',
                value: controller.user.value.fullName,
                onPressed: () => Get.to(() => const ChaneName()),
              ),
              TProfileMenu(
                title: 'Username',
                value: controller.user.value.username,
                onPressed: () {},
              ),
              const SizedBox(
                height: TSize.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: TSize.spaceBtwItems,
              ),
              const TSectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSize.spaceBtwItems,
              ),
              TProfileMenu(
                title: 'User ID',
                value: controller.user.value.id,
                onPressed: () {},
                iconData: Iconsax.copy,
              ),
              TProfileMenu(
                title: 'E-mail',
                value: controller.user.value.email,
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Phone Number',
                value: controller.user.value.phoneNumber,
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Gender',
                value: 'Male',
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Date of Birth',
                value: '24 Nov , 1999',
                onPressed: () {},
              ),
              const Divider(),
              const SizedBox(
                height: TSize.spaceBtwItems,
              ),
              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
