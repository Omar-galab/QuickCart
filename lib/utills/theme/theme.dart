import 'package:flutter/material.dart';
import 'package:shop_app/utills/constants/colores.dart';
import 'package:shop_app/utills/theme/custom_themes/appbar_theme.dart';
import 'package:shop_app/utills/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:shop_app/utills/theme/custom_themes/checkbox_them.dart';
import 'package:shop_app/utills/theme/custom_themes/chip_theme.dart';
import 'package:shop_app/utills/theme/custom_themes/elevated_button_theme.dart';
import 'package:shop_app/utills/theme/custom_themes/outlined_button_them.dart';
import 'package:shop_app/utills/theme/custom_themes/text_button_theme.dart';
import 'package:shop_app/utills/theme/custom_themes/text_theme.dart';
import 'package:shop_app/utills/theme/custom_themes/text_field_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(


    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTeme.lightChipTheme,
    scaffoldBackgroundColor: TColore.white,
    appBarTheme: TAppBarTheme.lightAppbarTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTeem,
    outlinedButtonTheme: TOutlinedButton.lghtOutlinedButtontehem,
    inputDecorationTheme: TTextFromFieldTheme.lightInputDecorationThem,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    textButtonTheme: TTextButtonTheme.lightTextButton,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    chipTheme: TChipTeme.darkChipTheme,
    appBarTheme: TAppBarTheme.darkAppbarTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTeem,
    outlinedButtonTheme: TOutlinedButton.darkOutlinedButtontehem,
    inputDecorationTheme: TTextFromFieldTheme.darkInputDecorationThem,
    scaffoldBackgroundColor: TColore.black,
    textTheme: TTextTheme.darkTextTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    textButtonTheme: TTextButtonTheme.darkTextButton,
  );
}
