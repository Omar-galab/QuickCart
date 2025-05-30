import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_app/utills/constants/size.dart';

class TProfileMenu extends StatelessWidget {
  const TProfileMenu({
    super.key,
    required this.title,
    required this.value,
    this.iconData = Iconsax.arrow_right_34,
    required this.onPressed,
  });

  final String title, value;
  final IconData iconData;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSize.spaceBtwItems/1.5),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                )),
            Expanded(
                flex: 5,
                child: Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                )),
            Expanded(
                child: Icon(
              iconData,
              size: 18,
            )),
          ],
        ),
      ),
    );
  }
}
