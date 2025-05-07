import 'package:flutter/material.dart';

import '../../../utills/constants/size.dart';
import 'shammer.dart';

class TCategoryShimmer extends StatelessWidget {
  const TCategoryShimmer({
    super.key,
    this.itemCount = 6,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) =>
        const SizedBox(width: TSize.spaceBtwItems),
        itemBuilder: (_, __) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Circular Shimmer Image
              ClipOval(
                child: TShimmerEffect(
                  width: 55,
                  height: 55,
                  radius: 55, // Ensure circular shape
                ),
              ),
               SizedBox(height: TSize.spaceBtwItems / 2),
              // Text Shimmer
              TShimmerEffect(
                width: 55,
                height: 8,
              ),
            ],
          );
        },
      ),
    );
  }
}
