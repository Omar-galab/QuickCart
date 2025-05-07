import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/common/widgets/shimmers/shammer.dart';
import 'package:shop_app/features/shop/controllers/banner_controller.dart';
import 'package:shop_app/utills/constants/colores.dart';

import '../../../../../common/widgets/custom_shapes/container/circular_container.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utills/constants/size.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      if (controller.isLoading.value) {
        return const TShimmerEffect(width: double.infinity, height: 190);
      }

      //not found
      if(controller.banners.isEmpty){
        return const Center(child: Text('No Data Found'),);
      }
      else {
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, _) =>
                    controller.updatePageIndicator(index),
              ),
              items: controller.banners
                  .map(
                    (banner) =>
                    TRoundedImage(
                        imageUrl: banner.imageUrl,
                        isNetworkImage: true,
                        onPressed: () => Get.toNamed(banner.targetScreen)),
              )
                  .toList(),
            ),
            const SizedBox(
              height: TSize.spaceBtwItems,
            ),
            Center(
              child: Obx(
                    () =>
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (int i = 0; i < controller.banners.length; i++)
                          TCircularContainer(
                            width: 20,
                            height: 4,
                            margin: const EdgeInsets.only(right: 10),
                            backGroundColor:
                            controller.carousalCurrentIndex.value == i
                                ? TColore.primary
                                : TColore.grey,
                          ),
                      ],
                    ),
              ),
            )
          ],
        );
      }
    });
  }
}
