import 'package:flutter/material.dart';
import 'package:shop_app/utills/helpers/helper_function.dart';

import '../../../../utills/constants/colores.dart';
import '../../../../utills/constants/image_settings.dart';
import '../../../../utills/constants/size.dart';
import '../../images/rounded_image.dart';
import '../../text/barnd_title_text_with_verified_icon.dart';
import '../../text/product_title_text.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final dark =THelper.isDarkMode(context);
    return Row(
      children: [
        TRoundedImage(
          imageUrl: TImages.sneakersProducts1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSize.sm),
          backgroundColor: dark ? TColore.darkerGrey : TColore.light,
        ),
        const SizedBox(width: TSize.spaceBtwItems,),
        ///--Title ,Price & Size
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TBrandTitleWithVerifiedIcon(title: 'Pengtree'),
            const Flexible(child: TProductTitleText(title: 'Orange sport shoe' ,maxLines: 1,)),
            Text.rich(TextSpan(
                children: [
                  TextSpan(text: 'Color ' ,style: Theme.of(context).textTheme.bodySmall),

                  TextSpan(text: 'Orange ' ,style: Theme.of(context).textTheme.bodyLarge),
                  TextSpan(text: 'Size ' ,style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(text: 'UK 08 ' ,style: Theme.of(context).textTheme.bodyLarge),
                ]
            ))
          ],
        )
      ],
    );
  }
}