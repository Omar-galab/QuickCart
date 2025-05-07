import 'package:flutter/material.dart';
import 'package:shop_app/common/widgets/text/section_heading.dart';
import 'package:shop_app/utills/constants/size.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        Text(
          'Omar glab',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: TSize.spaceBtwItems / 2,),
        Row(
          children: [
            const Icon(Icons.phone ,color: Colors.grey ,size: 16,),
            const SizedBox(width: TSize.spaceBtwItems,),
            Text('+2-01069222819' ,style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(width: TSize.spaceBtwItems,),
        Row(
          children: [
            const Icon(Icons.location_history ,color: Colors.grey ,size: 16,),
            const SizedBox(width: TSize.spaceBtwItems,),
            Text('Sidi Jaber-Alexandria' ,style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
      ],
    );
  }
}
