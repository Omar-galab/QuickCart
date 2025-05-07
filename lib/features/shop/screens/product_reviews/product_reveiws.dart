import 'package:flutter/material.dart';
import 'package:shop_app/common/widgets/appbar/appbar.dart';
import 'package:shop_app/features/shop/screens/product_reviews/widget/rating_progress_indicator.dart';
import 'package:shop_app/features/shop/screens/product_reviews/widget/user_review_card.dart';
import 'package:shop_app/utills/constants/size.dart';

import '../../../../common/widgets/prodacts/ratings/rating_indicator.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const TAppBar(
        title: Text('Review & Ratings'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Ratings and reviews are verified and are from people who use the same type of device that you use'),
              const SizedBox(
                height: TSize.spaceBtwItems,
              ),

              ///- Overall Product Ratings
              const TOverallProductRating(),
              const TRatingBarIndicator(rating: 3.5,),
              Text('12,635',style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: TSize.spaceBtwItems,),
              const TUserReviewCard(),
              const TUserReviewCard(),
              const TUserReviewCard(),
            ],
          ),

        ),
      ),
    );
  }
}


