import 'package:flutter/material.dart';
import 'package:shop_app/common/widgets/appbar/appbar.dart';
import 'package:shop_app/utills/constants/size.dart';

import '../../../../common/widgets/prodacts/sortable/sortable_products.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        title: Text(
          "Popular Products",
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSize.defultSpace),
          child: TSortableProducts(),
        ),
      ),
    );
  }
}


