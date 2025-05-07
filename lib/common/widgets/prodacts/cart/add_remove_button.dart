import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_app/utills/helpers/helper_function.dart';

import '../../../../utills/constants/colores.dart';
import '../../../../utills/constants/size.dart';
import '../../icon/circular_icon.dart';

class TProductQuantityWithAddRer extends StatelessWidget {
  const TProductQuantityWithAddRer({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final dark =THelper.isDarkMode(context);
    return Row(
        mainAxisSize: MainAxisSize.min,
      children: [

        TCircularIcon(icon: Iconsax.minus ,

          width: 32,
          height: 32,
          size: TSize.md,
          color: dark ? TColore.white :TColore.black,
          backgroundColor: dark ? TColore.darkerGrey :TColore.light,

        ),
        const SizedBox(width: TSize.spaceBtwItems,),
        Text('2' ,style: Theme.of(context).textTheme.titleSmall,),
        const SizedBox(width: TSize.spaceBtwItems,),
        const TCircularIcon(icon: Iconsax.add ,
          width: 32,
          height: 32,
          size: TSize.md,
          color: TColore.white,
          backgroundColor: TColore.primary,

        ),

      ],
    );
  }
}