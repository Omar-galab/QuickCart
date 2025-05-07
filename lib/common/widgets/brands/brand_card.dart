
import 'package:flutter/material.dart';

import '../custom_shapes/container/rounded_container.dart';
import '../images/circular_image.dart';
import '../text/barnd_title_text_with_verified_icon.dart';
import '../../../utills/constants/colores.dart';
import '../../../utills/constants/enums.dart';
import '../../../utills/constants/image_settings.dart';
import '../../../utills/constants/size.dart';
import '../../../utills/helpers/helper_function.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key, required this.showBorder, this.onTape,
  });
  final bool showBorder;
  final void Function()? onTape;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTape,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSize.sm),
        showBorder: showBorder,
        backGroundColor: Colors.transparent,
        child: Row(
          children: [
            /// ---Icon
            Flexible(
              child: TCircularIMage(
                width: 56,
                height: 56,
                isNetworkIMage: false,
                image: TImages.sneakersProducts1,
                backGroundColor: Colors.transparent,
                overLayColor: THelper.isDarkMode(context) ? TColore.white :TColore.black,
              ),
            ),

            const SizedBox(height: TSize.spaceBtwItems / 2,),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:CrossAxisAlignment.start ,
                children: [
                  const TBrandTitleWithVerifiedIcon(title: 'Shoe' ,textSize: TextSize.large,),
                  Text('280 Products' ,overflow: TextOverflow.ellipsis,

                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}