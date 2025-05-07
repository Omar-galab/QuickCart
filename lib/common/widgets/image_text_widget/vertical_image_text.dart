import 'package:flutter/material.dart';
import 'package:shop_app/common/widgets/images/circular_image.dart';

import '../../../utills/constants/colores.dart';
import '../../../utills/constants/size.dart';
import '../../../utills/helpers/helper_function.dart';


class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = TColore.white,
    this.backgroundColor,
    this.onTape,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTape;

  @override
  Widget build(BuildContext context) {
    final dark = THelper.isDarkMode(context);
    return GestureDetector(
      onTap: onTape,
      child: Padding(
        padding: const EdgeInsets.only(right: TSize.spaceBtwItems),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(TSize.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? (dark? TColore.black :TColore.white),
                shape: BoxShape.circle,

              ),
              child: TCircularIMage(
                width: 80,height: 80,
                image: image,
                fit: BoxFit.fitWidth,
                padding: TSize.sm ,
                isNetworkIMage: true,
                backGroundColor: backgroundColor,
                overLayColor: THelper.isDarkMode(context) ? TColore.light : TColore.dark ,
              )
            ),
            const SizedBox(height: TSize.defultSpace/2,),
            SizedBox(
              width: 56,

              child: Text(

                title,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}