import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/common/widgets/appbar/appbar.dart';
import 'package:shop_app/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:shop_app/common/widgets/success_screen/success_screen.dart';
import 'package:shop_app/features/shop/screens/cart/widget/cart_view_item.dart';
import 'package:shop_app/features/shop/screens/checkout/widget/billing_address_section.dart';
import 'package:shop_app/features/shop/screens/checkout/widget/billing_amount_section.dart';
import 'package:shop_app/features/shop/screens/checkout/widget/billing_payment_section.dart';
import 'package:shop_app/navigation_menu.dart';
import 'package:shop_app/utills/constants/colores.dart';
import 'package:shop_app/utills/constants/image_settings.dart';
import 'package:shop_app/utills/constants/size.dart';
import 'package:shop_app/utills/helpers/helper_function.dart';

import '../../../../common/widgets/prodacts/cart/coupon_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelper.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defultSpace),
          child: Column(
            children: [
              const TCartItems(
                showAddRemoveButton: false,
              ),
              const SizedBox(
                height: TSize.spaceBtwSections,
              ),

              ///Coupon TextField
              const TCouponCode(),
              const SizedBox(
                height: TSize.spaceBtwSections,
              ),

              /// --Billing Section
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSize.md),
                backGroundColor: dark ? TColore.black : TColore.white,
                child: const Column(
                  children: [
                    /// Pricing
                    TBillingAmountSection(),
                    SizedBox(
                      height: TSize.spaceBtwItems,
                    ),

                    ///Divider
                    Divider(),
                    SizedBox(
                      height: TSize.spaceBtwItems,
                    ),

                    ///Payment method
                    TBillingPaymentSection(),
                    SizedBox(
                      height: TSize.spaceBtwItems,
                    ),
                    TBillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSize.defultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => SuccessScreen(
              image: TImages.transactionSuccess,
              title: 'PaymentSuccess',
              subtitle: 'Your item will be shipping soon!',
              onpressed: () => Get.offAll(() => const NavigationMenu()))),
          child: const Text(r'Checkout $250.0'),
        ),
      ),
    );
  }
}
