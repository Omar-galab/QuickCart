import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:shop_app/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:shop_app/common/widgets/prodacts/ratings/rating_indicator.dart';
import 'package:shop_app/utills/constants/colores.dart';
import 'package:shop_app/utills/constants/image_settings.dart';
import 'package:shop_app/utills/constants/size.dart';
import 'package:shop_app/utills/helpers/helper_function.dart';

class TUserReviewCard extends StatelessWidget {
  const TUserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelper.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(TImages.user),
                ),
                const SizedBox(
                  width: TSize.spaceBtwItems,
                ),
                Text(
                  'Ayman BT',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(
          height: TSize.spaceBtwItems,
        ),
        Row(
          children: [
            const TRatingBarIndicator(rating: 4),
            const SizedBox(
              width: TSize.spaceBtwItems,
            ),
            Text(
              '01 Nov , 2024',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(
          height: TSize.spaceBtwItems,
        ),
        const ReadMoreText(
          'I like it They are countable..little squeaky on wood floors but that\'s okay. Great. price thank you.',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: 'Show less',
          trimCollapsedText: 'Show more',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColore.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColore.primary),
        ),
        const SizedBox(
          height: TSize.spaceBtwItems,
        ),
        TRoundedContainer(
          backGroundColor: dark ? TColore.darkerGrey : TColore.grey,
          child: Padding(
            padding: const EdgeInsets.all(TSize.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'G_Store',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '01 Nov , 2024',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(
                  height: TSize.spaceBtwItems,
                ),
                const ReadMoreText(
'I bought these for my uncle. He absolutely loves the loafer look but with an athletic sole. I was worried they wouldn\'t look as good as they did online, but they are very nice! He says they are very comfortable, stylish and very sturdy. He loves them and wants more in other colors.',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: 'Show less',
                  trimCollapsedText: 'Show more',
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColore.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColore.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: TSize.spaceBtwSections,),
      ],
    );
  }
}
