import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_app/features/shop/models/product_model.dart';

import '../../../../utills/constants/size.dart';
import '../../layouts/grid_layout.dart';
import '../prodacts_cart/products_card_vertical.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///Dropdown
        DropdownButtonFormField(
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Newest',
            'Popularity'
          ]
              .map((option) => DropdownMenuItem(value: option,child: Text(option),))
              .toList(),
          onChanged: (value) {},
          decoration:
          const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
        ),
        const SizedBox(height: TSize.spaceBtwSections,),
        ///Products
        TGridLayout(itemCount: 8, itemBuilder: (_,index)=> TProductsCardVertical(product: ProductModel.empty(),))
      ],
    );
  }
}