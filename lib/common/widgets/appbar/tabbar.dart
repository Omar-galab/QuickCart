import 'package:flutter/material.dart';
import 'package:shop_app/utills/device/device_utility.dart';

import '../../../utills/constants/colores.dart';
import '../../../utills/helpers/helper_function.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark =THelper.isDarkMode(context);
    return Material(
      color: dark ? TColore.black : TColore.white,
      child: TabBar(
        tabs: tabs,

        isScrollable: true,
        indicatorColor: TColore.primary,
        labelColor: dark ? TColore.white : TColore.primary,

        unselectedLabelColor: TColore.darkGrey,

      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtilite.getAppBarHeight());
}
