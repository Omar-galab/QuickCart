import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/common/widgets/loaders/animation_loader.dart';
import 'package:shop_app/utills/constants/colores.dart';
import 'package:shop_app/utills/helpers/helper_function.dart';

class TFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => PopScope(
              canPop: false,
              child: Container(
                color: THelper.isDarkMode(Get.context!)
                    ? TColore.dark
                    : TColore.light,
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 250,
                    ),
                    TAnimationLoaderWidget(
                      text: text,
                      animation: animation,
                    ),
                  ],
                ),
              ),
            ));
  }
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();//close the dialog using navigator
  }
}
