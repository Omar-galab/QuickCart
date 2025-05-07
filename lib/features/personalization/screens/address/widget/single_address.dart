import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_app/utills/constants/colores.dart';
import 'package:shop_app/utills/constants/size.dart';
import 'package:shop_app/utills/helpers/helper_function.dart';

import '../../../../../common/widgets/custom_shapes/container/rounded_container.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = THelper.isDarkMode(context);
    return Column(
      children: [
        TRoundedContainer(
          padding: const EdgeInsets.all(TSize.md),
          width: double.infinity,
          showBorder: true,
          backGroundColor: selectedAddress
              ? TColore.primary.withOpacity(0.5)
              : Colors.transparent,
          borderColor: selectedAddress
              ? Colors.transparent
              : dark
                  ? TColore.darkerGrey
                  : TColore.grey,
          margin: const EdgeInsets.only(bottom: TSize.spaceBtwSections),
          child: Stack(
            children: [
              Positioned(
                right: 5,
                top: 0,
                child: Icon(
                  selectedAddress ? Iconsax.tick_circle : null,
                  color: selectedAddress
                      ? dark
                          ? TColore.light
                          : TColore.dark.withOpacity(0.2)
                      : null,
                ),
              ),
              Column(
                crossAxisAlignment:CrossAxisAlignment.start ,
                children: [
                  Text(
                    'Omar glab',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: TSize.sm / 2,
                  ),
                  const Text(
                    '(+2): 01069222819',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: TSize.sm / 2,
                  ),
                  const Text(
                    '36992 Al Iskandariyah , Alexandria ,Egypt',

                    softWrap: true,
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
