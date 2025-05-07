import 'package:flutter/material.dart';
import 'package:shop_app/utills/constants/colores.dart';

class TShadowStyle{
  static final verticalProductShadow =BoxShadow(
    color: TColore.darkerGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0 , 2),

  );

  static final horizontalProductShadow =BoxShadow(
    color: TColore.darkerGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0 , 2),
  );
}