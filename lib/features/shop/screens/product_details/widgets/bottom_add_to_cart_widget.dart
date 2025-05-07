import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_app/common/widgets/icon/circular_icon.dart';
import 'package:shop_app/utills/constants/colores.dart';
import 'package:shop_app/utills/constants/size.dart';
import 'package:shop_app/utills/helpers/helper_function.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelper.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: TSize.defultSpace, vertical: TSize.defultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? TColore.darkerGrey : TColore.light,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(TSize.cardRadiusLg),
          topLeft: Radius.circular(TSize.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const TCircularIcon(
                icon: Iconsax.minus,
                width: 40,
                height: 40,
                backgroundColor: TColore.darkGrey,
                color: Colors.white,
              ),
              const SizedBox(width: TSize.spaceBtwItems,),
              Text('2', style: Theme.of(context).textTheme.titleSmall,),
              const SizedBox(width: TSize.spaceBtwItems,),
              const TCircularIcon(
                icon: Iconsax.add,
                width: 40,
                height: 40,
                backgroundColor: TColore.black,
                color: Colors.white,
              ),
            ],
          ),

          ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(TSize.md),
            backgroundColor: TColore.black,
            side: const BorderSide(color: TColore.black )
          ), child: const Text('Add to cart'),)
          
        ],
      ),
    );
  }
}
