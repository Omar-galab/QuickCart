import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_app/utills/constants/enums.dart';

import '../../../utills/constants/colores.dart';
import '../../../utills/constants/size.dart';
import 'brand_title_text.dart';

class TBrandTitleWithVerifiedIcon extends StatelessWidget {
  const TBrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLine = 1,
    this.textColor,
    this.iconColor = TColore.primary,
    this.textAlign = TextAlign.center,
    this.textSize = TextSize.small,
  });

  final String title;
  final int maxLine;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSize textSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: TBrandTitleText(
            title: title,
            maxLine: maxLine,
            textSize: textSize,
            color: textColor,
            textAlign: textAlign,

          ),
        ),
        const SizedBox(
          width: TSize.xs,
        ),
        Icon(
          Iconsax.verify5,
          color: iconColor,
          size: TSize.iconSm,
        )
      ],
    );
  }
}
