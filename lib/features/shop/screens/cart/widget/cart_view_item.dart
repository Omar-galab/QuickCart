import 'package:flutter/material.dart';
import 'package:shop_app/utills/constants/size.dart';
import 'package:shop_app/utills/helpers/helper_function.dart';

import '../../../../../common/widgets/prodacts/cart/add_remove_button.dart';
import '../../../../../common/widgets/prodacts/cart/cart_item.dart';
import '../../../../../common/widgets/text/product_price_text.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,  this.showAddRemoveButton = true,

  });


 final bool showAddRemoveButton ;
  @override
  Widget build(BuildContext context) {

    final dark = THelper.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) =>
      const SizedBox(
        height: TSize.spaceBtwSections,
      ),
      itemCount: 2,
      itemBuilder: (_, index) =>
           Column(
            children: [
              /// cart Items
              const TCartItem(),
            if(showAddRemoveButton)  const SizedBox(height: TSize.spaceBtwItems,),

              ///Add or remove Items
              if(showAddRemoveButton)
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 70,),
                      TProductQuantityWithAddRer(),
                    ],
                  ),

                  TProductPriceText(price: '250'),
                ],
              )

            ],
          ),
    );
  }
}