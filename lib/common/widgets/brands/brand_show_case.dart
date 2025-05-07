import 'package:flutter/material.dart';

import 'brand_card.dart';
import '../../../utills/constants/colores.dart';
import '../../../utills/constants/image_settings.dart';
import '../../../utills/constants/size.dart';
import '../../../utills/helpers/helper_function.dart';
import '../custom_shapes/container/rounded_container.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key, required this.image,
  });
  final List<String> image;
  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(

      showBorder: true,
      padding: const EdgeInsets.all(TSize.md),
      borderColor: TColore.darkGrey,
      backGroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSize.spaceBtwItems),
      child: Column(
        children: [
          ///Brands with Products count
          const TBrandCard(showBorder: false),
          const SizedBox(height: TSize.spaceBtwItems,),
          ///Brand Top 3 product image
          Row(
              children: image.map((image) => brandTopProductImageWidget(context, image)).toList()
          )
        ],
      ),
    );
  }

  Expanded brandTopProductImageWidget(BuildContext context ,String image) {
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        backGroundColor: THelper.isDarkMode(context)
            ? TColore.darkerGrey
            : TColore.light,
        margin: const EdgeInsets.only(right: TSize.sm),
        padding: const EdgeInsets.all(TSize.sm),
        child: const Image(fit: BoxFit.contain, image: AssetImage(TImages.sneakersProducts1),),
      ),
    );
  }
}