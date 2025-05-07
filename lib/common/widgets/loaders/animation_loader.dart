import 'dart:core';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_app/utills/constants/colores.dart';
import 'package:shop_app/utills/constants/size.dart';

class TAnimationLoaderWidget extends StatelessWidget {
  const TAnimationLoaderWidget({super.key,
    required this.text,
    required this.animation,
     this.showAction = false,
    this.actionText,
    this.onActionPressed});

  final String text, animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset(animation,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.8),
          const SizedBox(
            height: TSize.defultSpace,
          ),
          Text(
            text,
            style: Theme
                .of(context)
                .textTheme
                .bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: TSize.defultSpace,),
          showAction
              ? SizedBox(
            width: 250,
            child: OutlinedButton(onPressed: onActionPressed,
              style: OutlinedButton.styleFrom(backgroundColor: TColore.dark),
              child: Text(actionText!, style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: TColore.light),),),)
              :const SizedBox(),

        ],
      ),
    );
  }
}
