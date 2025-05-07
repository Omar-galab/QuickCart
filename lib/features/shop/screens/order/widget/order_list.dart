import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_app/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:shop_app/utills/constants/colores.dart';
import 'package:shop_app/utills/constants/size.dart';
import 'package:shop_app/utills/helpers/helper_function.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelper.isDarkMode(context);
    return ListView.separated(
      itemCount: 10,
      shrinkWrap: true,
      separatorBuilder: (_,index)=>const SizedBox(height: TSize.spaceBtwItems,),
      itemBuilder:(_,index)=> TRoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(TSize.md),
        backGroundColor: dark ? TColore.dark : TColore.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Icon(Iconsax.ship),
                const SizedBox(
                  width: TSize.defultSpace / 2,
                ),
                Expanded(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Processing',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: TColore.primary, fontWeightDelta: 1),
                    ),
                    Text(
                      '14 Dec 2024',
                      style: Theme.of(context).textTheme.headlineSmall,
                    )
                  ],
                )),
                IconButton(onPressed: () {}, icon: const Icon(Iconsax.arrow_right_34))
              ],
            ),

            const SizedBox(height: TSize.defultSpace,),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Iconsax.tag),
                      const SizedBox(
                        width: TSize.defultSpace / 2,
                      ),
                      Expanded(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium,
                          ),
                          Text(
                            '[#24198]',
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      )),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Iconsax.calendar),
                      const SizedBox(
                        width: TSize.defultSpace / 2,
                      ),
                      Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Shipping Date',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium,

                              ),
                              Text(
                                '14 Dec 2024',
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
