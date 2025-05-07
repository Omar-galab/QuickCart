import 'package:flutter/material.dart';
import 'package:shop_app/utills/helpers/helper_function.dart';

import '../../../../utills/constants/colores.dart';
import '../../../../utills/constants/size.dart';
import '../../custom_shapes/container/rounded_container.dart';

class TCouponCode extends StatelessWidget {
  const TCouponCode({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final dark =THelper.isDarkMode(context);
    return TRoundedContainer(
      showBorder: true,
      backGroundColor: dark ? TColore.dark : TColore.light,
      padding: const EdgeInsets.only(
          top: TSize.sm,
          right: TSize.sm,
          bottom: TSize.sm,
          left: TSize.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a promo code? Enter here',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
              width: 80,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    foregroundColor: dark ?TColore.white.withOpacity(0.5) :TColore.dark.withOpacity(0.5 ),
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    side: BorderSide(color: Colors.grey.withOpacity(0.1))
                ),
                child: const Text('Apply'),
              ))
        ],
      ),
    );
  }
}