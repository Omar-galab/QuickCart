import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_app/utills/constants/colores.dart';
import 'package:shop_app/utills/helpers/helper_function.dart';

class TShimmerEffect extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final Color? color;

  const TShimmerEffect(
      {super.key,
      required this.width,
      required this.height,
       this.radius=15,
       this.color});

  @override
  Widget build(BuildContext context) {
    final dark=THelper.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color??(dark? TColore.darkerGrey : TColore.white),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
