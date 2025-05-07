import 'package:flutter/material.dart';
import 'package:shop_app/utills/constants/size.dart';

import '../../../../utills/constants/colores.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius = TSize.cardRadiusLg,
    this.padding,
    this.child,
    this.backGroundColor = TColore.white,
    this.margin,
     this.showBorder = false,
     this.borderColor =TColore.borderPrimary,
  });

  final double? width;
  final double? height;
  final double radius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final Color backGroundColor;
  final bool showBorder;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
        color: backGroundColor,
      ),
      child: child,
    );
  }
}
