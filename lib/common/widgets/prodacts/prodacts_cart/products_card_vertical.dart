import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_app/common/styles/shadows.dart';
import 'package:shop_app/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:shop_app/common/widgets/images/rounded_image.dart';
import 'package:shop_app/common/widgets/text/product_title_text.dart';
import 'package:shop_app/features/shop/controllers/product/product_controller.dart';
import 'package:shop_app/features/shop/enums/enums.dart';
import 'package:shop_app/features/shop/models/product_model.dart';
import 'package:shop_app/features/shop/screens/product_details/product_details.dart';
import 'package:shop_app/utills/constants/colores.dart';
import 'package:shop_app/utills/constants/image_settings.dart';
import 'package:shop_app/utills/constants/size.dart';
import 'package:shop_app/utills/helpers/helper_function.dart';

import '../../icon/circular_icon.dart';
import '../../text/barnd_title_text_with_verified_icon.dart';
import '../../text/product_price_text.dart';

class TProductsCardVertical extends StatelessWidget {
  const TProductsCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = THelper.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailsScreen(
            product: product,
          )),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSize.proudactImageRadius),
          color: dark ? TColore.darkerGrey : TColore.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSize.sm),
              backGroundColor: dark ? TColore.black : TColore.light,
              child: Stack(
                children: [
                  TRoundedImage(
                    isNetworkImage: true,
                    imageUrl: product.thumbnail,
                    applyImageRadius: true,
                  ),
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSize.sm,
                      backGroundColor: TColore.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSize.sm, vertical: TSize.xs),
                      child: Text(
                        '$salePercentage%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColore.black),
                      ),
                    ),
                  ),
                  const Positioned(
                      top: 0,
                      right: 0,
                      child: TCircularIcon(
                        icon: Iconsax.heart5,
                        color: Colors.red,
                        backgroundColor: Colors.transparent,
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: TSize.spaceBtwItems / 2,
            ),

            //Details
            Padding(
              padding: EdgeInsets.only(left: TSize.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(
                    title: product.title,
                    smallSize: true,
                  ),
                  SizedBox(
                    height: TSize.spaceBtwItems / 2,
                  ),
                  TBrandTitleWithVerifiedIcon(
                    title: product.brand!.name,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(children: [
                    if (product.productType == ProductType.single.toString() &&
                        product.salePrice > 0)
                      Padding(
                        padding: EdgeInsets.only(left: TSize.sm),
                        child: Text(product.price.toString(),
                          style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),

                        ),
                      ),
                    Padding(
                      padding: EdgeInsets.only(left: TSize.sm),
                      child: TProductPriceText(
                        price: controller.getProductPrice(product),
                      ),
                    ),
                  ]),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: TColore.dark,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(TSize.cardRadiusMd),
                        bottomRight:
                            Radius.circular(TSize.proudactImageRadius)),
                  ),
                  child: const SizedBox(
                      width: TSize.iconLg * 1.2,
                      height: TSize.iconLg * 1.2,
                      child: Center(
                          child: Icon(
                        Iconsax.add,
                        color: TColore.white,
                      ))),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
