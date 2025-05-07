import 'package:flutter/material.dart';
import 'package:shop_app/common/widgets/layouts/grid_layout.dart';
import 'package:shop_app/common/widgets/prodacts/prodacts_cart/products_card_vertical.dart';
import 'package:shop_app/common/widgets/text/section_heading.dart';
import 'package:shop_app/features/shop/models/category_model.dart';
import 'package:shop_app/features/shop/models/product_model.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utills/constants/image_settings.dart';
import '../../../../../utills/constants/size.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({
    super.key, required this.category,
  });
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return  ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children:[ Padding(
        padding: const EdgeInsets.all(TSize.defultSpace),
        child: Column(
          children: [
            //Brands
            const TBrandShowCase(
              image: [
                TImages.sneakersProducts1,
                TImages.sneakersProducts1,
                TImages.sneakersProducts1
              ],
            ),
            const SizedBox(height: TSize.spaceBtwItems,),
            TSectionHeading(title: 'You might like' ,onPressed: (){},),
            const SizedBox(height: TSize.spaceBtwItems,),

            TGridLayout(itemCount: 4, itemBuilder: (_,index) => TProductsCardVertical(product:ProductModel.empty(),))

          ],
        ),
      ),
    ]
    );
  }
}