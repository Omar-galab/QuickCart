import 'package:flutter/material.dart';
import 'package:shop_app/common/widgets/images/circular_image.dart';
import 'package:shop_app/common/widgets/text/barnd_title_text_with_verified_icon.dart';
import 'package:shop_app/common/widgets/text/product_price_text.dart';
import 'package:shop_app/common/widgets/text/product_title_text.dart';
import 'package:shop_app/utills/constants/enums.dart';
import 'package:shop_app/utills/constants/image_settings.dart';
import 'package:shop_app/utills/helpers/helper_function.dart';

import '../../../../../common/widgets/custom_shapes/container/rounded_container.dart';
import '../../../../../utills/constants/colores.dart';
import '../../../../../utills/constants/size.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelper.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TRoundedContainer(
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
            const SizedBox(
              width: TSize.spaceBtwItems,
            ),
            Text(
              '\$250',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(
              width: TSize.spaceBtwItems,
            ),
            const TProductPriceText(price: '175',isLarge: true,)
          ],
        ),
        const SizedBox(
          height: TSize.spaceBtwItems / 1.5,
        ),
        const TProductTitleText(title: 'Orange Pengtree Sports Shoe '),
        const SizedBox(
          height: TSize.spaceBtwItems / 1.5,
        ),
        Row(
          children: [
            const TProductTitleText(title: 'Status:' ,smallSize: true, ),

            Text('In Stock',style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),

        const SizedBox(
          height: TSize.spaceBtwItems / 1.5,
        ),
        Row(
          children: [
            TCircularIMage(image: TImages.sneakersProducts1,
            width: 32,
            height: 32,
            overLayColor: dark ?TColore.white :TColore.black,),
            const TBrandTitleWithVerifiedIcon(title: 'Pengtree' ,textSize: TextSize.medium,),
          ],
        )
      ],
    );
  }
}
