import 'package:fastfoodapp/config/sizes.dart';
import 'package:fastfoodapp/config/text_them.dart';
import 'package:fastfoodapp/pagescustom/product_review/widgets/rating.dart';
import 'package:fastfoodapp/pagescustom/product_review/widgets/total_rating_2.dart';
import 'package:fastfoodapp/pagescustom/product_review/widgets/user_review.dart';
import 'package:flutter/material.dart';

class ProductReview extends StatelessWidget {
  const ProductReview({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Gà rán giòn được ướp gia vị và hương vị đậm đà và vị giòn rụm khiến món ăn này trở thành lựa chọn yêu thích của nhiều người. Chắc chắn, chúng tôi sẽ làm hài lòng mọi thực khách!"),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TotalRate(),
              const Padding(
                padding: EdgeInsets.only(
                    left: 10.0), // Điều chỉnh giá trị theo ý muốn của bạn
                child: start(rating: 4.9),
              ),

              Text("24,724", style: TTextTheme.whiteTextTheme.bodySmall),
              const SizedBox(height: TSizes.spaceBtwSections),
              //
              const UserReviews(),
              const UserReviews(),
                   const UserReviews(),
                        const UserReviews(),
                             const UserReviews(),
                                  const UserReviews(),
              
            ],
          ),
        ),
      ),
    );
  }
}
