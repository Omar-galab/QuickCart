import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_app/common/widgets/appbar/appbar.dart';
import 'package:shop_app/common/widgets/custom_shapes/container/primary_header_contianer.dart';
import 'package:shop_app/common/widgets/list_tiles/settings_menu_tiles.dart';
import 'package:shop_app/common/widgets/text/section_heading.dart';
import 'package:shop_app/data/repositories/product/product_repositories.dart';
import 'package:shop_app/data/repositories/repositories_authentication/authentication_repositories.dart';
import 'package:shop_app/features/personalization/screens/address/address.dart';
import 'package:shop_app/features/personalization/screens/profile/profile.dart';
import 'package:shop_app/features/shop/dummy/dummy_data.dart';
import 'package:shop_app/features/shop/screens/order/order.dart';
import 'package:shop_app/utills/constants/colores.dart';
import 'package:shop_app/utills/constants/size.dart';

import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../../data/repositories/categories/category_repositories.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryRepository = Get.put(CategoryRepository());
    final productRepository =Get.put(ProductRepository());
    //  final List<CategoryModel> categories = [
    //   CategoryModel(id: '1', image: TImages.sportIcon, name: 'Sports', isFeatured: true),
    //   CategoryModel(id: '5', image: TImages.furnitureIcon, name: 'Furniture', isFeatured: true),
    //   CategoryModel(id: '2', image: TImages.electronicsIcon, name: 'Electronics', isFeatured: true),
    //   CategoryModel(id: '3', image: TImages.clothIcon, name: 'Clothes', isFeatured: true),
    //   CategoryModel(id: '4', image: TImages.animalIcon, name: 'Animals', isFeatured: true),
    //   CategoryModel(id: '6', image: TImages.shoeIcon, name: 'Shoes', isFeatured: true),
    //   CategoryModel(id: '7', image: TImages.cosmeticsIcon, name: 'Cosmetics', isFeatured: true),
    //   CategoryModel(id: '14', image: TImages.jeweleryIcon, name: 'Jewelery', isFeatured: true),
    // ];


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                TAppBar(
                  title: Text(
                    'Account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: TColore.white),
                  ),
                ),
                 TUserProfileTile(onPressed: ()=> Get.to(()=> const ProfileScreen()), ),
                const SizedBox(
                  height: TSize.spaceBtwSections,
                ),
              ],
            )),
             Padding(
              padding: const EdgeInsets.all(TSize.defultSpace),
              child: Column(
                children: [
                  //Account Settings
                  const TSectionHeading(title: 'Account settings' ,showActionButton: false ,),
                  const SizedBox(
                    height: TSize.spaceBtwItems,
                  ),
                  TSettingsMenuTiles(
                      icon: Iconsax.safe_home,
                      title: 'My Address',
                      subTitle: 'Set shopping delivery address',
                    onTape: ()=>Get.to(()=>const UserAddressScreen()),

                  ),
                  TSettingsMenuTiles(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subTitle: 'Add, remove products and move to checkout',
                    onTape: (){},

                  ),
                  TSettingsMenuTiles(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subTitle: 'In-progress and complete orders',
                    onTape: ()=>Get.to(()=>const OrderScreen()),

                  ),
                  TSettingsMenuTiles(
                    icon: Iconsax.bank,
                    title: 'Bank Account',
                    subTitle: 'Withdraw balance to registered bank account',
                    onTape: (){},

                  ),
                  TSettingsMenuTiles(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subTitle: 'List of all discounted coupons',
                    onTape: (){},

                  ),
                  TSettingsMenuTiles(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subTitle: 'Set any kind of notification massage',
                    onTape: (){},

                  ),
                  TSettingsMenuTiles(
                    icon: Iconsax.security_card,
                    title: 'Account privacy',
                    subTitle: 'Mange data usage and connected accounts',
                    onTape: (){},

                  ),
                  const SizedBox(
                    height: TSize.spaceBtwSections,
                  ),
                  //--App settings
                  const TSectionHeading(title: 'App settings' ,showActionButton: false ,),
                  const SizedBox(
                    height: TSize.spaceBtwItems,
                  ),
                  TSettingsMenuTiles(

                    
                    icon: Iconsax.cloud,
                    title: 'Load Data',
                    subTitle: 'Upload data to your cloud account',
                    onTape: ()=>productRepository.uploadAllProductImages(DummyData.products)
                    //=>_categoryRepository.uploadDummyData(categories),

                  ),
                  TSettingsMenuTiles(


                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Set recommendation based on location',
                    trailing: Switch(value: true,onChanged: (value){}, ),
                    onTape: (){},

                  ),
                  TSettingsMenuTiles(


                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false , onChanged: (value){}, ),
                    onTape: (){},

                  ),
                  TSettingsMenuTiles(


                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subTitle: 'Set image quality to be seen',
                    trailing: Switch(value: false,onChanged: (value){}, ),
                    onTape: (){},

                  ),
                  SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () => AuthenticationRepository.instance.logout(),
                        child: const Text('Logout'),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
