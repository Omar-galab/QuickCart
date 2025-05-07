import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'Product_variation_model.dart';
import 'brand_model.dart';
import 'product_attribute_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    required this.title,
    required this.stock,
    required this.price,
    required this.thumbnail,
    required this.productType,
    this.sku,
    this.brand,
    this.date,
    this.images,
    this.salePrice = 0.0,
    required this.isFeatured,
    this.description,
    this.categoryId,
    this.productAttributes,
    this.productVariations,
  });


// Create Empty func for clean code
  static ProductModel empty() => ProductModel(
    id: '',
    title: '',
    stock: 0,
    price: 0,
    thumbnail: '',
    productType: '', isFeatured: false,
  );

// Json Format
  Map<String, dynamic> toJson() {
    return {
      'SKU': sku,
      'Title': title,
      'Stock': stock,
      'Price': price,
      'Images': images ?? [],
      'Thumbnail': thumbnail,
      'SalePrice': salePrice,
      'IsFeatured': isFeatured,
      'CategoryId': categoryId,
      'Brand': brand?.toJson(),
      'Description': description,
      'ProductType': productType,
      'ProductAttributes': productAttributes != null ? productAttributes!.map((e) => e.toJson()).toList() : [],
      'ProductVariations': productVariations != null ? productVariations!.map((e) => e.toJson()).toList() : [],
    };
  }

  // Map Json oriented document snapshot from Firebase to Model
  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      if (kDebugMode) {
        print("-----------------Mapping Category: ${data.toString()}");
        print("IsFeatured value: ${data['IsFeatured']} (${data['IsFeatured']?.runtimeType})");
      }

      try {
        return ProductModel(
          id: document.id,
          sku: data['SKU'],
          title: data['Title'] ?? '',
          stock: data['Stock'] ?? 0,
          isFeatured: (data['IsFeatured'] is bool)
              ? data['IsFeatured']
              : (data['IsFeatured']?.toString().toLowerCase() == 'true'),
          price: double.parse((data['Price'] ?? 0.0).toString()),
          salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
          thumbnail: data['Thumbnail'] ?? '',
          categoryId: data['CategoryId'] ?? '',
          description: data['Description'] ?? '',
          productType: data['ProductType'] ?? '',
          brand: data['Brand'] != null ? BrandModel.fromJson(data['Brand']) : null,
          images: data['Images'] != null ? List<String>.from(data['Images']) : [],
          productAttributes: (data['ProductAttributes'] as List<dynamic>?)
              ?.map((e) => ProductAttributeModel.fromJson(e))
              .toList() ?? [],
          productVariations: (data['ProductVariations'] as List<dynamic>?)
              ?.map((e) => ProductVariationModel.fromJson(e))
              .toList() ?? [],
        );
      } catch (e) {
        if (kDebugMode) {
          print("Error while mapping product with ID ${document.id}: $e");
        }
        return ProductModel.empty();
      }
    } else {
      if (kDebugMode) {
        print("-----------------Document data is null");
      }
      return ProductModel.empty();
    }
  }

}





