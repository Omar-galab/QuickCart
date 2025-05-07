import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_app/features/shop/controllers/product/images_controller.dart';
import 'package:shop_app/utills/helpers/helper_function.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icon/circular_icon.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utills/constants/colores.dart';
import '../../../../../utills/constants/image_settings.dart';
import '../../../../../utills/constants/size.dart';
import '../../../models/product_model.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelper.isDarkMode(context);
    final controller = Get.put(ImageController());
    final images = controller.getAllProductImages(product);
    return TCurvedEdgesWidget(
      child: Container(
        color: dark ? TColore.darkerGrey : TColore.light,
        child: Stack(
          children: [
            SizedBox(
                height: 400,
                child: Padding(
                  padding: EdgeInsets.all(TSize.proudactImageRadius * 2),
                  child: Center(child: Obx(() {
                    final image = controller.selectedProductImage.value;
                    return  CachedNetworkImage(imageUrl:image ,progressIndicatorBuilder: (_,__,downloadProgress)=>
                        CircularProgressIndicator(value: downloadProgress.progress ,color: TColore.primary,)
                      ,);


                  })),
                )),
            Positioned(
                right: 0,
                bottom: 30,
                left: 24,
                child: SizedBox(
                  height: 80,
                  child: ListView.separated(
                    itemCount: images.length,
                    separatorBuilder: (_, __) => const SizedBox(
                      width: TSize.spaceBtwItems,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (_, index) => Obx(
                      (){
                        final imageSelected =controller.selectedProductImage.value ==images[index];
                        return TRoundedImage(
                          imageUrl: images[index],
                          isNetworkImage: true,
                          width: 80,
                          backgroundColor: dark ? TColore.dark : TColore.light,
                          border: Border.all(color: imageSelected? TColore.primary : Colors.transparent),
                          padding: const EdgeInsets.all(TSize.sm),
                        );
                      }
                    ),
                  ),
                )),
            const TAppBar(
              showBackArrow: true,
              actions: [
                TCircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
