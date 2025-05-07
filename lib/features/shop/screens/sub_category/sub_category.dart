import 'package:flutter/material.dart';
import 'package:shop_app/common/widgets/appbar/appbar.dart';
import 'package:shop_app/common/widgets/images/rounded_image.dart';
import 'package:shop_app/common/widgets/prodacts/prodacts_cart/products_card_horizontal.dart';
import 'package:shop_app/common/widgets/text/section_heading.dart';
import 'package:shop_app/utills/constants/image_settings.dart';
import 'package:shop_app/utills/constants/size.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Sports Shirts'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defultSpace),
          child: Column(
            children: [
              //Banner
              const TRoundedImage(
                imageUrl: TImages.promoBanner1,
                width: double.infinity,
                applyImageRadius: true,
              ),
              const SizedBox(
                height: TSize.spaceBtwSections,
              ),

              /// Sub Category
              Column(
                children: [
                  TSectionHeading(
                    title: 'Sport shoe',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: TSize.spaceBtwItems / 2,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(
                        width: TSize.spaceBtwItems,
                      ),
                      itemBuilder: (context, index) =>
                          const TProductsCardHorizontal(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
