import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_app/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:shop_app/common/widgets/images/rounded_image.dart';
import 'package:shop_app/common/widgets/text/barnd_title_text_with_verified_icon.dart';
import 'package:shop_app/common/widgets/text/product_price_text.dart';
import 'package:shop_app/common/widgets/text/product_title_text.dart';
import 'package:shop_app/utills/constants/colores.dart';
import 'package:shop_app/utills/constants/image_settings.dart';
import 'package:shop_app/utills/constants/size.dart';
import 'package:shop_app/utills/helpers/helper_function.dart';

import '../../icon/circular_icon.dart';

class TProductsCardHorizontal extends StatelessWidget {
  const TProductsCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelper.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(TSize.proudactImageRadius),
        color: dark ? TColore.darkerGrey : TColore.softGrey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(TSize.sm),
            backGroundColor: dark ? TColore.black : TColore.white,
            child: Stack(
              children: [
                const SizedBox(

                  width: 120,
                  height: 120,

                  child: TRoundedImage(
                    imageUrl: TImages.sneakersProducts1,
                    applyImageRadius: true,
                  ),
                ),
                Positioned(
                  top: 12,
                  child: TRoundedContainer(
                    radius: TSize.sm,
                    backGroundColor: TColore.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSize.sm, vertical: TSize.xs),
                    child: Text(
                      '25%',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: TColore.black),
                    ),
                  ),
                ),
                const Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                      backgroundColor: Colors.transparent,
                    ))
              ],
            ),
          ),
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: TSize.sm, left: TSize.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(
                        title: 'Orange shoe pentgreen',
                        smallSize: true,
                      ),
                      SizedBox(
                        height: TSize.defultSpace / 2,
                      ),
                      TBrandTitleWithVerifiedIcon(title: 'Pentgreen')
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(child: TProductPriceText(price: '235.0')),
                      Container(
                        decoration: const BoxDecoration(
                          color: TColore.dark,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(TSize.cardRadiusMd),
                              bottomRight:
                                  Radius.circular(TSize.proudactImageRadius)),
                        ),
                        child: const SizedBox(
                            width: TSize.iconLg * 1.2,
                            height: TSize.iconLg * 1.2,
                            child: Center(
                                child: Icon(
                              Iconsax.add,
                              color: TColore.white,
                            ))),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
