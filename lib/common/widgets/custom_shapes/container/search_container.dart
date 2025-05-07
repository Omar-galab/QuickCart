import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utills/constants/colores.dart';
import '../../../../utills/constants/size.dart';
import '../../../../utills/device/device_utility.dart';
import '../../../../utills/helpers/helper_function.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTape,
    this.padding = const EdgeInsets.symmetric(horizontal: TSize.defultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTape;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final dark = THelper.isDarkMode(context);
    return GestureDetector(
      onTap: onTape,
      child: Padding(
        padding: padding,
        child: Container(
          width: TDeviceUtilite.getScreenWidth(context),
          padding: const EdgeInsets.all(TSize.md),
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? TColore.dark
                    : TColore.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(TSize.cardRadiusLg),
            border: showBorder ? Border.all(color: TColore.grey) : null,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: TColore.darkerGrey,
              ),
              const SizedBox(
                width: TSize.spaceBtwItems,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
