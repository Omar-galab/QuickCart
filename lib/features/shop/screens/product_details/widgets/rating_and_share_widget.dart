import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utills/constants/size.dart';

class TRatingAndShare extends StatelessWidget {
  const TRatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(

          children: [
            const Icon(Iconsax.star ,color: Colors.amber, size: 24,),
            const SizedBox(width: TSize.spaceBtwItems/2,),
            Text.rich(TextSpan(
                children: [
                  TextSpan(text: '5.0 ',style: Theme.of(context).textTheme.bodyLarge),
                  const TextSpan(text: '(199)'),
                ]
            )),

          ],

        ),
        IconButton(onPressed: (){}, icon: const Icon(Iconsax.share,size: TSize.iconMd,))
      ],
    );
  }
}