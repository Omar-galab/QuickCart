import 'package:flutter/material.dart';
import 'package:shop_app/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:shop_app/common/widgets/text/product_price_text.dart';
import 'package:shop_app/common/widgets/text/product_title_text.dart';
import 'package:shop_app/common/widgets/text/section_heading.dart';
import 'package:shop_app/utills/constants/colores.dart';
import 'package:shop_app/utills/constants/size.dart';
import 'package:shop_app/utills/helpers/helper_function.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelper.isDarkMode(context);

    return Column(
      children: [
        TRoundedContainer(
          padding: const EdgeInsets.all(TSize.md),
          backGroundColor: dark ? TColore.darkerGrey : TColore.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: <Widget>[
                  const TSectionHeading(
                    title: 'Variation',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: TSize.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(
                            title: 'Price: ',
                            smallSize: true,
                          ),

                          //Actual Price
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
                          const TProductPriceText(price: '200')
                        ],
                      ),
                      //Stock
                      Row(
                        children: [
                          const TProductTitleText(
                            title: 'Stock: ',
                            smallSize: true,
                          ),
                          Text('In Stock',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),

                      /// Variation Description

                    ],
                  )
                ],
              ),

              const TProductTitleText(
                title: 'Running Shoe with a lightweight EVA sole',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: TSize.spaceBtwItems,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Color'),
            const SizedBox(
              height: TSize.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                  text: 'Green',
                  selected: false,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: 'Blue',
                  selected: false,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: 'Yellow',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Size'),
            const SizedBox(
              height: TSize.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                  text: 'Eu 43',
                  selected: true,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: 'Eu 44',
                  selected: false,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: 'Eu 45',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
