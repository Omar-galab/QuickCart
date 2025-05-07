import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/common/widgets/shimmers/category_shammer.dart';
import 'package:shop_app/features/shop/controllers/category_controller.dart';
import 'package:shop_app/features/shop/screens/sub_category/sub_category.dart';

import '../../../../../common/widgets/image_text_widget/vertical_image_text.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(() {
      if (categoryController.isLoading.value) return const TCategoryShimmer();
      if (categoryController.featureCategories.isEmpty) {
        return Center(child: Text('No data Fount', style: Theme
            .of(context)
            .textTheme
            .bodyMedium!
            .apply(color: Colors.white),),);
      }
      return SizedBox(
        height: 90,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.featureCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category =categoryController.featureCategories[index];
            return TVerticalImageText(
              image: category.image,
              title: category.name,
              onTape: () => Get.to(() => const SubCategoryScreen()),
            );
          },
        ),
      );
    }
    );
  }
}
