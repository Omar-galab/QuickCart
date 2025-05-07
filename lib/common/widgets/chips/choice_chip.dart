import 'package:flutter/material.dart';
import 'package:shop_app/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:shop_app/utills/helpers/helper_function.dart';

import '../../../utills/constants/colores.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = THelper.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() :  Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? TColore.white : null),
        avatar: isColor
            ? TCircularContainer(
                width: 50, height: 50, backGroundColor: THelper.getColor(text)!)
            : null,
        shape: isColor ? const CircleBorder() : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        backgroundColor: isColor ? THelper.getColor(text) : null,
        padding: isColor ? const EdgeInsets.all(0) : null,

      ),
    );
  }
}
