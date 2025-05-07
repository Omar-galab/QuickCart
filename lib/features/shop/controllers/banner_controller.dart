import 'package:get/get.dart';
import 'package:shop_app/data/repositories/banners/banners_repositories.dart';
import 'package:shop_app/features/shop/models/banner_model.dart';

import '../../../utills/popups/loaders.dart';

class BannerController extends GetxController{

  final carousalCurrentIndex=0.obs;
  final isLoading = false.obs;
  final RxList<BannerModel>banners =<BannerModel>[].obs;


  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  void updatePageIndicator(index){
    carousalCurrentIndex.value =index;
  }

  //--Load Category data
  Future<void> fetchBanners() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;

      //Fetch Banners
      final bannerRepo =Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      //Assign Banners
      this.banners.assignAll(banners);


    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isLoading.value=false;
    }
  }
}