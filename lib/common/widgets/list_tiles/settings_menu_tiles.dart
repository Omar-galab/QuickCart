import 'package:flutter/material.dart';
import 'package:shop_app/utills/constants/colores.dart';

class TSettingsMenuTiles extends StatelessWidget {
  const TSettingsMenuTiles(
      {super.key,
      required this.icon,
      required this.title,
      required this.subTitle,
      this.trailing, this.onTape});

  final IconData icon;
  final String title, subTitle;
  final Widget? trailing;
  final VoidCallback? onTape;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
        color: TColore.primary,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      trailing: trailing,
      onTap: onTape,
    );
  }
}
