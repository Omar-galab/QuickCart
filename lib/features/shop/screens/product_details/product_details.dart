import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:shop_app/common/widgets/text/section_heading.dart';
import 'package:shop_app/features/shop/models/product_model.dart';
import 'package:shop_app/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:shop_app/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:shop_app/features/shop/screens/product_details/widgets/product_image_slider.dart';
import 'package:shop_app/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:shop_app/features/shop/screens/product_details/widgets/rating_and_share_widget.dart';
import 'package:shop_app/features/shop/screens/product_reviews/product_reveiws.dart';
import 'package:shop_app/utills/constants/size.dart';
import 'package:shop_app/utills/helpers/helper_function.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //--Product Image Slider
             TProductImageSlider(product: product,),

            //-Product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: TSize.defultSpace,
                  left: TSize.defultSpace,
                  bottom: TSize.defultSpace),
              child: Column(
                children: [
                  //Rating && Share
                  const TRatingAndShare(),
                  //- Price & Title & Stock & Brand
                  const TProductMetaData(),
                  const TProductAttributes(),
                  const SizedBox(
                    height: TSize.spaceBtwItems,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Check out'))),
                  const SizedBox(
                    height: TSize.spaceBtwItems,
                  ),
                 ///Description
                 const TSectionHeading(title: 'Description',showActionButton: false,),
                 const ReadMoreText(
                    'Made of durable tricot fabric, the sole made from comfy pvc pure,Suitable for sports fashion, Soft textile inner lining to ensure comfort for the feet, 100% proudly made in egypt.',
                  trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                   moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                   lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                  ),
                  ///-Reviews
                  const Divider(),
                  const SizedBox(height: TSize.spaceBtwItems,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(title: 'Reviews(24)',showActionButton: false,),
                      IconButton(onPressed: ()=>Get.to(()=>const ProductReviewScreen()), icon: const Icon(Iconsax.arrow_right_3,size: 18,))
                    ],
                  ),
                  const SizedBox(height: TSize.spaceBtwSections,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
