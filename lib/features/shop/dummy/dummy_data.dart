import 'package:shop_app/utills/constants/image_settings.dart';

import '../models/Product_variation_model.dart';
import '../models/brand_model.dart';
import '../models/product_attribute_model.dart';
import '../models/product_model.dart';

class DummyData{
  // List of all Products
  static final List<ProductModel> products = [
    ProductModel(
      id: '001',
      title: 'Green Nike sports shoe',
      stock: 15,
      price: 135,
      isFeatured: true,
      thumbnail: TImages.productImage1,
      description: 'Green Nike sports shoe',
      brand: BrandModel(
        id: '1',
        image: TImages.nikeLogo,
        name: 'Nike',
        productsCount: 265,
        isFeatured: true,
      ),
      images: [
        TImages.productImage1,
        TImages.productImage23,
        TImages.productImage21,
        TImages.productImage9,
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 122.6,
          image: TImages.productImage1,
          description: 'This is a product description for Green Nike sports shoe.',
          attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 20,
          price: 140,
          salePrice: 130.0,
          image: TImages.productImage2,
          description: 'This is a product description for Black Nike sports shoe.',
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 0,
          price: 234,
          image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
        ),
// ProductVariationModel
        ProductVariationModel(
          id: '4',
          stock: 222,
          price: 232,
          image: TImages.productImage1,
          attributeValues: {'Color': 'Green', 'Size': 'EU 32'},
        ),
// ProductVariationModel
        ProductVariationModel(
          id: '5',
          stock: 0,
          price: 334,
          image: TImages.productImage21,
          attributeValues: {'Color': 'Red', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 11,
          price: 332,
          image: TImages.productImage21,
          attributeValues: {'Color': 'Red', 'Size': 'EU 32'},
        ),
      ],
      // ProductVariationModel
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '002',
      title: 'Blue T-shirt for all ages',
      stock: 15,
      price: 35,
      isFeatured: true,
      thumbnail: TImages.productImage69,
      description: 'Blue  Zara T-shirt',
      brand: BrandModel(
        id: '6',
        image: TImages.zaraLogo,
        name: 'Zara',
      ),
      images: [
        TImages.productImage68,
        TImages.productImage69,
        TImages.productImage5,

      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel(name: 'Size', values: [ 'EU32', 'EU34']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 122.6,
          image: TImages.productImage68,
          description: 'This is a product description for blue zara T-shirt.',
          attributeValues: {'Color': 'Blue', 'Size': 'EU34'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 20,
          price: 140,
          salePrice: 130.0,
          image: TImages.productImage69,
          description: 'This is a product description for black zara T-shirt.',
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 0,
          price: 234,
          image: TImages.productImage5,
          attributeValues: {'Color': 'Red', 'Size': 'EU34'},
        ),

      ],
      // ProductVariationModel
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '003',
      title: '4 Color Collar  T-shirt for dry fit',
      stock: 15,
      price: 75,
      isFeatured: true,
      thumbnail: TImages.productImage69,
      description: 'Blue  Zara T-shirt',
      brand: BrandModel(
        id: '6',
        image: TImages.zaraLogo,
        name: 'Zara',
      ),
      images: [
        TImages.productImage60,
        TImages.productImage61,
        TImages.productImage62,
        TImages.productImage63,
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Red', 'Yellow', 'Green']),
        ProductAttributeModel(name: 'Size', values: [ 'EU 30','EU 32', 'EU 34']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 122.6,
          image: TImages.productImage60,
          description: 'This is a product description for blue zara T-shirt.',
          attributeValues: {'Color': 'Red', 'Size': 'EU34'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 20,
          price: 140,
          salePrice: 130.0,
          image: TImages.productImage61,
          description: 'This is a product description for black zara T-shirt.',
          attributeValues: {'Color': 'Yalow', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 0,
          price: 234,
          image: TImages.productImage62,
          attributeValues: {'Color': 'Green', 'Size': 'EU34'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 0,
          price: 234,
          image: TImages.productImage63,
          attributeValues: {'Color': 'Blue', 'Size': 'EU34'},
        ),

      ],
      // ProductVariationModel
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '004',
      title: 'Nike Air Jorden Shoes',
      stock: 15,
      price: 35,
      isFeatured: true,
      thumbnail: TImages.productImage10,
      description: 'Nike Air Jorden Shoes for running ',
      brand: BrandModel(
        id: '1',
        image: TImages.nikeLogo,
        name: 'Nike',
      ),
      images: [
        TImages.productImage7,
        TImages.productImage8,
        TImages.productImage9,
        TImages.productImage10,

      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Orange', 'Black', 'Brown']),
        ProductAttributeModel(name: 'Size', values: [ 'EU 32','EU 32', 'EU 34']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 122.6,
          image: TImages.productImage8,
          description: 'This is a product description for blue zara T-shirt.',
          attributeValues: {'Color': 'Orange', 'Size': 'EU34'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 20,
          price: 140,
          salePrice: 130.0,
          image: TImages.productImage7,
          description: 'This is a product description for black zara T-shirt.',
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 0,
          price: 234,
          image: TImages.productImage9,
          attributeValues: {'Color': 'Brown', 'Size': 'EU34'},
        ),

      ],
      // ProductVariationModel
      productType: 'ProductType.variable',
    ),

  ];



}