import 'package:flutter/material.dart';

import '../../../utills/constants/enums.dart';

class TBrandTitleText extends StatelessWidget {
  const TBrandTitleText({
    super.key,
    required this.title,
    this.maxLine = 1,
    this.textSize = TextSize.small,
    this.color,
    this.textAlign = TextAlign.center,
  });

  final String title;
  final int maxLine;
  final TextSize textSize;
  final Color? color;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLine,
      style: textSize == TextSize.small
          ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
          : textSize == TextSize.medium
              ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
              : textSize == TextSize.large
                  ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
                  : Theme.of(context).textTheme.bodyMedium!.apply(color: color),
    );
  }
}
