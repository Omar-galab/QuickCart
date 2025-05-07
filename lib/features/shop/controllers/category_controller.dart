import 'package:get/get.dart';
import 'package:shop_app/data/repositories/categories/category_repositories.dart';
import 'package:shop_app/features/shop/models/category_model.dart';
import 'package:shop_app/utills/popups/loaders.dart';


class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featureCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

//--Load Category data
  Future<void> fetchCategories() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;

      //Fetch Categories from data sours (FireBase ,Api ,...)
      final categories = await _categoryRepository.getAllCategories();

      // Update the Categories List
      allCategories.assignAll(categories);

      //Filter Feature category
      featureCategories.assignAll(allCategories
        ..where((category) => category.isFeatured && category.parentId.isEmpty)
            .take(8)
            .toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isLoading.value=false;
    }
  }



}
