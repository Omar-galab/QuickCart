import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/common/widgets/appbar/appbar.dart';
import 'package:shop_app/features/shop/screens/cart/widget/cart_view_item.dart';
import 'package:shop_app/features/shop/screens/checkout/checkout.dart';
import 'package:shop_app/utills/constants/size.dart';
import 'package:shop_app/utills/helpers/helper_function.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelper.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme
              .of(context)
              .textTheme
              .headlineSmall,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSize.defultSpace),
        child: TCartItems(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSize.defultSpace),
        child: ElevatedButton(onPressed: ()=>Get.to(()=>const CheckoutScreen()), child: const Text(r'Checkout $250.0'),),
      ),
    );
  }
}






