import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/common/widgets/appbar/appbar.dart';
import 'package:shop_app/common/widgets/appbar/tabbar.dart';
import 'package:shop_app/common/widgets/custom_shapes/container/search_container.dart';
import 'package:shop_app/common/widgets/layouts/grid_layout.dart';
import 'package:shop_app/common/widgets/prodacts/cart/cart_menu_icon.dart';
import 'package:shop_app/common/widgets/text/section_heading.dart';
import 'package:shop_app/common/widgets/brands/brand_card.dart';
import 'package:shop_app/features/shop/controllers/category_controller.dart';
import 'package:shop_app/features/shop/screens/brand/all_brands.dart';
import 'package:shop_app/features/shop/screens/store/widget/category_tab.dart';
import 'package:shop_app/utills/constants/colores.dart';
import 'package:shop_app/utills/constants/size.dart';
import 'package:shop_app/utills/helpers/helper_function.dart';


class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories =CategoryController.instance.featureCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        backgroundColor:
            THelper.isDarkMode(context) ? TColore.black : TColore.white,
        appBar: TAppBar(
          title: const Text('Store'),
          actions: [TCartCountIcon(onPressed: () {})],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  backgroundColor: THelper.isDarkMode(context)
                      ? TColore.black
                      : TColore.white,
                  floating: true,
                  expandedHeight: 440.0,
                  forceElevated: innerBoxIsScrolled,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(TSize.defultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        //--Search bar
                        const SizedBox(
                          height: TSize.spaceBtwItems,
                        ),
                        const TSearchContainer(
                          text: 'Search in Store',
                          showBorder: true,
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(
                          height: TSize.spaceBtwSections,
                        ),

                        // --Featured Brands

                        TSectionHeading(
                          title: 'Featured Brands',
                          onPressed: ()=> Get.to(()=>const AllBrandsScreen()),
                        ),
                        const SizedBox(
                          height: TSize.spaceBtwItems / 1.5,
                        ),
                        TGridLayout(
                            itemCount: 4,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              return const TBrandCard(
                                showBorder: true,
                              );
                            }),
                      ],
                    ),
                  ),
                  bottom:  TTabBar(
                    tabs:categories.map((category)=>Tab(child: Text(category.name),)).toList()
                  )),
            ];
          },
          body:  TabBarView(
            children: categories.map((category) => TCategoryTab(category: category)).toList()
          ),
        ),
      ),
    );
  }
}


