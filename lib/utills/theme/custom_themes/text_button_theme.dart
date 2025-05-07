import 'package:flutter/material.dart';

class TTextButtonTheme{
  TTextButtonTheme._();

  static final lightTextButton=TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.black,
      textStyle: const TextStyle(
           color: Colors.black, ),



    )
  );
  static final darkTextButton=TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
             color: Colors.white, ),



      )
  );
}