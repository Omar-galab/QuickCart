import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_app/features/personalization/controllers/user_controller.dart';

import '../../../utills/constants/colores.dart';
import '../../../utills/constants/image_settings.dart';
import '../images/circular_image.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key, required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: const TCircularIMage(
        image: TImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        controller.user.value.fullName,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .apply(color: TColore.white),
      ),
      subtitle: Text(
        controller.user.value.email,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .apply(color: TColore.white),
      ),
      trailing: IconButton(onPressed: onPressed,icon: const Icon(Iconsax.edit,color: TColore.white, ) ,),
    );
  }
}