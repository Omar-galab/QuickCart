import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../features/shop/enums/enums.dart';
import '../../../features/shop/models/product_model.dart';
import '../../../utills/exceptions/firebase_exceptions.dart';
import '../../../utills/exceptions/platform_exceptions.dart';
import '../../services/firebase_storage_service.dart';

/// Repository for managing product-related data and operations.
class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  /// Firestore instance for database interactions.
  final _db = FirebaseFirestore.instance;


  /// Get limited featured products
  /// Get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db.collection('Products').get();
      if (kDebugMode) {
        print('Snapshot Product size: ${snapshot.size}');
      }
      for (var doc in snapshot.docs) {
        print("Document ID: ${doc.id}");
        print("IsFeatured value: ${doc['IsFeatured']}");
        print("IsFeatured type: ${doc['IsFeatured'].runtimeType}");
      }

      final list = snapshot.docs.map((document) => ProductModel.fromSnapshot(document)).toList();
      if (kDebugMode) {
        print('Category List: $list');
      }
      return list;
    } on FirebaseException catch (e) {
      print("FirebaseException: ${e.message}");
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      print("PlatformException: ${e.message}");
      throw TPlatformException(e.code).message;
    } catch (e) {
      print("Error fetching featured products: $e");
      throw 'Something went wrong. Please try again.';
    }
  }


  /// Upload dummy data to the Cloud Firebase


  Future<void> uploadAllProductImages(List<ProductModel> products) async {
    try {
      final storage = Get.put(FirebaseStorageService());

      for (var product in products) {
        // Upload product thumbnail
        final thumbnail = await storage.getImageDataFromAssets(product.thumbnail);
        final thumbnailUrl = await storage.uploadImageData(
          'products/thumbnails',
          thumbnail,
          product.thumbnail.split('/').last,
        );
        product.thumbnail = thumbnailUrl;

        // Upload product images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imageUrls = [];
          for (var imagePath in product.images!) {
            final image = await storage.getImageDataFromAssets(imagePath);
            final imageUrl = await storage.uploadImageData(
              'products/images',
              image,
              imagePath.split('/').last,
            );
            imageUrls.add(imageUrl);
          }
          product.images = imageUrls;
        }

        // Upload variation images
        if (product.productVariations != null) {
          for (var variation in product.productVariations!) {
            if (variation.image.isNotEmpty) {
              final variationImage = await storage.getImageDataFromAssets(variation.image);
              final variationImageUrl = await storage.uploadImageData(
                'products/variations',
                variationImage,
                variation.image.split('/').last,
              );
              variation.image = variationImageUrl;
            }
          }
        }

        // Upload the product to Firestore
        await FirebaseFirestore.instance
            .collection('Products')
            .doc(product.id)
            .set(product.toJson());

        print('Product ${product.title} uploaded successfully!');
      }

      print('All products uploaded successfully!');
    } catch (e) {
      print('Error uploading products: $e');
    }
  }


}


