import 'package:flutter/material.dart';
import 'package:shop_app/utills/constants/colores.dart';
import 'package:shop_app/utills/helpers/helper_function.dart';

class TDividorLogin extends StatelessWidget {
  const TDividorLogin({
    super.key,
    required this.dividorText,
  });
  final String dividorText;
  @override
  Widget build(BuildContext context) {
    final dark = THelper.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark ? TColore.darkerGrey : TColore.grey,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          dividorText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            color: dark ? TColore.darkerGrey : TColore.grey,
            thickness: 0.5,
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}
