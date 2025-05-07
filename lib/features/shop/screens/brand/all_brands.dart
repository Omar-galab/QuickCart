import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/common/widgets/appbar/appbar.dart';
import 'package:shop_app/common/widgets/brands/brand_card.dart';
import 'package:shop_app/common/widgets/layouts/grid_layout.dart';
import 'package:shop_app/common/widgets/text/section_heading.dart';
import 'package:shop_app/features/shop/screens/brand/brand_products.dart';
import 'package:shop_app/utills/constants/size.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Brand'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defultSpace),
          child: Column(
            children: [
              const TSectionHeading(
                title: 'Brands',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSize.spaceBtwItems,
              ),
              TGridLayout(
                  mainAxisExtent: 80,
                  itemCount: 10,
                  itemBuilder: (context, index) => TBrandCard(
                        showBorder: true,
                        onTape: () => Get.to(() => const BrandProducts()),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
