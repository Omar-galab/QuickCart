import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/features/shop/models/product_model.dart';
import 'package:shop_app/utills/constants/size.dart';

class ImageController extends GetxController{
  static ImageController get instance => Get.find();

  /// Variable
  RxString selectedProductImage =''.obs;

  /// Get all images from product and variation
  List<String>getAllProductImages(ProductModel product){
    // Use Set to add unique images only
    Set<String> images ={};


    // Load image thumbnail

    images.add(product.thumbnail);

    //Assign Thumbnail as selected image
    selectedProductImage.value=product.thumbnail;

    // Get All Images from the product Model if not null
    if(product.images !=null){
      images.addAll(product.images!);

    }
    //Get all Images from Product variation
    if(product.productVariations != null || product.productVariations!.isNotEmpty){
      images.addAll(product.productVariations!.map((variation)=>variation.image));
    }
  return images.toList();

  }

  /// -- Show Image Popup
  void showEnlargedImage(String image){
    Get.to(
      fullscreenDialog: true,
        ()=>Dialog.fullscreen(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: TSize.defultSpace* 2 ,horizontal: TSize.defultSpace),
              child:  CachedNetworkImage(imageUrl: image),
              ),
              const SizedBox(height: TSize.spaceBtwSections,),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 150,
                  child: OutlinedButton(onPressed: ()=>Get.back(), child: Text('Close')),
                ),
              )

            ],
          ),
        )
    );
  }
}