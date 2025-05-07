import 'package:flutter/material.dart';
import 'package:shop_app/utills/constants/size.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Subtitle',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              r'$256.0',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(height: TSize.spaceBtwItems / 2,),
        ///Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shipping Fee',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              r'$6.0',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],

        ),
        const SizedBox(height: TSize.spaceBtwItems / 2,),
        ///Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tax Fee',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              r'$6.0',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),const SizedBox(height: TSize.spaceBtwItems / 2,),
        /// Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Order total',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              r'$6.0',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
      ],
    );
  }
}
