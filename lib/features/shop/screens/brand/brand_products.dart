import 'package:flutter/material.dart';
import 'package:shop_app/common/widgets/appbar/appbar.dart';
import 'package:shop_app/common/widgets/brands/brand_card.dart';
import 'package:shop_app/common/widgets/prodacts/sortable/sortable_products.dart';
import 'package:shop_app/utills/constants/size.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(title: Text('Nike'),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSize.defultSpace),
        child: Column(
          children: [
            TBrandCard(showBorder: true),
            SizedBox(height: TSize.spaceBtwSections,),
            TSortableProducts(),
          ],
        ),
        ),
      ),
    );
  }
}
