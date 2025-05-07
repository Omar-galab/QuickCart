import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_app/utills/helpers/helper_function.dart';

import '../../../../utills/constants/colores.dart';
class TCartCountIcon extends StatelessWidget {
  const TCartCountIcon({
    super.key,  this.iconColor, required this.onPressed,
  });
  final Color? iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = THelper.isDarkMode(context);
    return Stack(children: [
      IconButton(
          onPressed: onPressed,
          icon:  Icon(
            Iconsax.shopping_bag,
            color: iconColor,
          )),
      Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color:dark ? TColore.light :TColore.black,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                '2',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(
                    color:dark ? TColore.black :TColore.white,
                    fontSizeFactor: 0.8),
              ),
            ),
          ))
    ]);
  }
}