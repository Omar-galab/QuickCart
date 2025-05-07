import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/bindings/general_bindings.dart';
import 'package:shop_app/routes/app_routes.dart';
import 'package:shop_app/utills/constants/colores.dart';
import 'package:shop_app/utills/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      home:  const Scaffold(backgroundColor: TColore.primary , body: Center(
        child: CircularProgressIndicator(color: TColore.white,),
      ),),
    );
  }
}
