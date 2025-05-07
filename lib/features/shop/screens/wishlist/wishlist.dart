import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_app/common/widgets/appbar/appbar.dart';
import 'package:shop_app/common/widgets/icon/circular_icon.dart';
import 'package:shop_app/common/widgets/layouts/grid_layout.dart';
import 'package:shop_app/common/widgets/prodacts/prodacts_cart/products_card_vertical.dart';
import 'package:shop_app/features/shop/models/product_model.dart';
import 'package:shop_app/features/shop/screens/home/home_screen.dart';

import '../../../../utills/constants/size.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TAppBar(
        title: Text('Wishlist',style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          TCircularIcon(icon: Iconsax.add ,onPressed: ()=>Get.to( const HomeScreen()),),

        ],

      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defultSpace),
          child: Column(
            children: [
              TGridLayout(itemCount: 4, itemBuilder: (_,index)=>  TProductsCardVertical(product: ProductModel.empty(),)),
            ],
          ),
        ),
      ),
    );
  }
}
