import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shop_app/data/repositories/product/product_repositories.dart';
import 'package:shop_app/features/shop/models/product_model.dart';
import 'package:shop_app/utills/popups/loaders.dart';

import '../../enums/enums.dart';

class ProductController extends GetxController {
  final isLoading = false.obs;

  static ProductController get instance => Get.find();
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featureProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeatureProducts();
    super.onInit();
  }

  void fetchFeatureProducts() async {
    try {
      //show loader while loading Products
      isLoading.value = true;
      //Fetch Product


      final products = await productRepository.getFeaturedProducts();
      //Assign Products
      featureProducts.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Get the product price or price range for variations
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // If no variations exist, return the simple price or sale price
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      // Calculate the smallest and largest prices among variations
      for (var variation in product.productVariations!) {
        // Determine the price to consider (sale price if available, otherwise regular price)
        double priceToConsider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        // Update smallest and largest prices
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }

        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }

      // If smallest and largest prices are the same, return a single price
      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        // Otherwise, return a price range
        return '\$${smallestPrice} - \$${largestPrice}';
      }
    }
  }

  /// -- Calculate Discount Percentage
  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  /// -- Check Product Stock Status
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
