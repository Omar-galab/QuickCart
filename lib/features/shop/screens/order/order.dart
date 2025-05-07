import 'package:flutter/material.dart';
import 'package:shop_app/common/widgets/appbar/appbar.dart';
import 'package:shop_app/features/shop/screens/order/widget/order_list.dart';
import 'package:shop_app/utills/constants/size.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TAppBar(
        title: Text('My Orders' , style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSize.defultSpace),

        child: TOrderListItems(),
      ),
    );
  }
}
