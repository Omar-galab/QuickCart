import 'package:flutter/material.dart';
import 'package:shop_app/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:shop_app/common/widgets/text/section_heading.dart';
import 'package:shop_app/utills/constants/colores.dart';
import 'package:shop_app/utills/constants/image_settings.dart';
import 'package:shop_app/utills/constants/size.dart';
import 'package:shop_app/utills/helpers/helper_function.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelper.isDarkMode(context);
    return  Column(
      children: [
        TSectionHeading(title: 'PaymentMethod', buttonTitle: 'Change', onPressed: (){},),
        const SizedBox(height: TSize.spaceBtwItems / 2,),
        Row(
          children: [
            TRoundedContainer(
              width: 60,
              height: 35,
              backGroundColor: dark ? TColore.light : TColore.white,
              padding:  const EdgeInsets.all(TSize.sm),
              child: const Image(image: AssetImage(TImages.paypal),fit: BoxFit.contain,),

            ),
            const SizedBox(width: TSize.spaceBtwItems / 2,),
            Text('Paypal' ,style: Theme.of(context).textTheme.bodyLarge,)
          ],
        )
      ],
    );
  }
}
