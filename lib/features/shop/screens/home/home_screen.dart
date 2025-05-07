import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/common/widgets/custom_shapes/container/primary_header_contianer.dart';
import 'package:shop_app/common/widgets/shimmers/vertical_shimmer_product.dart';
import 'package:shop_app/features/shop/controllers/product/product_controller.dart';
import 'package:shop_app/features/shop/screens/all_products/all_products.dart';
import 'package:shop_app/features/shop/screens/home/widget/home_appbar.dart';
import 'package:shop_app/features/shop/screens/home/widget/home_categories.dart';
import 'package:shop_app/features/shop/screens/home/widget/promo_slider.dart';
import 'package:shop_app/utills/constants/size.dart';
import '../../../../common/widgets/custom_shapes/container/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/prodacts/prodacts_cart/products_card_vertical.dart';
import '../../../../common/widgets/text/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header
            const TPrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //AppBar
                  THomeAppBare(),
                  SizedBox(
                    height: TSize.spaceBtwSections,
                  ),

                  //SearchBar
                  TSearchContainer(
                    text: 'Search in Store',
                  ),

                  SizedBox(
                    height: TSize.spaceBtwItems,
                  ),

                  //Categories

                  Padding(
                    padding: EdgeInsets.all(TSize.defultSpace),
                    child: Column(
                      children: [
                        TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                        ),
                        SizedBox(
                          height: TSize.spaceBtwItems,
                        ),
                        //Categories
                        THomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //Body
            Padding(
                padding: const EdgeInsets.all(TSize.defultSpace),
                child: Column(
                  children: [
                    const TPromoSlider(),
                    const SizedBox(
                      height: TSize.spaceBtwSections,
                    ),
                    TSectionHeading(
                      title: 'Popular Products',
                      onPressed: () => Get.to(() => const AllProducts()),
                    ),
                    const SizedBox(
                      height: TSize.spaceBtwItems,
                    ),
                    Obx((){
                      if(controller.isLoading.value) return TVerticalProductShimmer();
                      if(controller.featureProducts.isEmpty){
                        return Center(child: Text('No Data Found',style: Theme.of(context).textTheme.bodyMedium,),);
                      }
                      return TGridLayout(
                        itemCount: controller.featureProducts.length,
                        itemBuilder: (_, index) =>  TProductsCardVertical(product: controller.featureProducts[index],),
                      );
                    }

                    )
                  ],
                )),

            //popular products
          ],
        ),
      ),
    );
  }
}
