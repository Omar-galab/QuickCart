import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/features/authentication/screens/loggin/login.dart';

class OnBoardingScrenController extends GetxController {
  static OnBoardingScrenController get Instance => Get.find();

  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  //update current index when page scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  //jump to spcific dat selected page
  void datNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  //update current index & jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      final storage = GetStorage();
      storage.write('IsFirstTime', false);
      Get.offAll(const LoginScreen());

    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  //update current index & jump to lsat page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
