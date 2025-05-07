import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/common/widgets/shimmers/shammer.dart';

import '../../../utills/constants/colores.dart';
import '../../../utills/constants/size.dart';
import '../../../utills/helpers/helper_function.dart';

class TCircularIMage extends StatelessWidget {
  const TCircularIMage({
    super.key,
     this.width=56 ,
     this.height=56 ,
    this.padding = TSize.sm,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkIMage = false,
    this.overLayColor,
    this.backGroundColor,
  });

  final double width, height, padding;
  final BoxFit? fit;
  final String image;
  final bool isNetworkIMage;
  final Color? overLayColor;
  final Color? backGroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backGroundColor ??
            (THelper.isDarkMode(context) ? TColore.black : TColore.white),
        shape: BoxShape.circle
      ),
      child: ClipOval (

        child: !isNetworkIMage
            ?Image(
          fit: BoxFit.cover,
          image: AssetImage(image) ,
          color: overLayColor,
        )
        :CachedNetworkImage(
                imageUrl: image,
                fit: fit,
                color: overLayColor,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    const TShimmerEffect(width: 55, height: 55, radius: 55,),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
      ),
    );
  }
}
