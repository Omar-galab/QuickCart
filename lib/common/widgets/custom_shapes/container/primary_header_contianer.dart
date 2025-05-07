import 'package:flutter/material.dart';
import 'package:shop_app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';

import '../../../../utills/constants/colores.dart';
import 'circular_container.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return  TCurvedEdgesWidget(
      child:  Container(
        color: TColore.primary,
        padding: const EdgeInsets.only(bottom: 12),
        child: Stack(

          children: [
            Positioned(
              top: -150,
              right: -250,
              child: TCircularContainer(
                backGroundColor: TColore.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: TCircularContainer(
                backGroundColor: TColore.textWhite.withOpacity(0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
