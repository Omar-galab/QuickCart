import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class CategoryModel {

  String id, name, image, parentId;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    this.parentId = '',
    required this.isFeatured,
  });

  ///Empty helper function
  static CategoryModel empty() =>
      CategoryModel(id: '', name: '', image: '', isFeatured: false);

  /// Convert model to json
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'ParentId': parentId,
      'IsFeatured': isFeatured,
    };
  }

  ///Map json oriented document snapshot from firebase to userModel
  // Map Json oriented document snapshot from Firebase to UserModel
  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      if (kDebugMode) {
        print("-----------------Mapping Category: ${data.toString()}");
      }  // Print the raw data to check mapping

      // Map JSON Record to the Model
      return CategoryModel(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        parentId: data['ParentId'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
      );
    } else {
      if (kDebugMode) {
        print("-----------------Document data is null");
      }
      return CategoryModel.empty();
    }
  }

}