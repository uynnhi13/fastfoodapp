import 'package:fastfoodapp/config/helper_functions.dart';
import 'package:fastfoodapp/config/image_strings.dart';
import 'package:fastfoodapp/config/sizes.dart';
import 'package:fastfoodapp/config/text_them.dart';
import 'package:fastfoodapp/pagescustom/product_review/widgets/container.dart';
import 'package:fastfoodapp/pagescustom/product_review/widgets/rating.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';


class UserReviews extends StatelessWidget {
  const UserReviews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                    backgroundImage: AssetImage(TImages.userProfileImage2)),
                SizedBox(width: TSizes.spaceBtwItems),
                Text('Yua Mikami',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black)),
              ],
            ),
            IconButton(onPressed: null, icon: Icon(Icons.more_vert))
          ],
        ),
        SizedBox(width: TSizes.spaceBtwItems),
        Row(
          children: [
            start(rating: 5),
            SizedBox(width: TSizes.spaceBtwItems),
            Text("24/07/2024", style: TTextTheme.whiteTextTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        const ReadMoreText(
            'Đồ ăn cơ ở đây thực sự ngon miệng và đa dạng. Tôi thích cách mà họ kết hợp các nguyên liệu tự nhiên và chế biến thành các món ăn hấp dẫn.',
            trimLines: 1,
            trimMode: TrimMode.Line,
            trimExpandedText: 'showless',
            trimCollapsedText: 'show more',
            moreStyle: TextStyle(
                fontSize: 14.0,
                color: Colors.black),
            lessStyle: TextStyle(
                fontSize: 14.0,
                color: Colors.black)),
        const SizedBox(height: TSizes.spaceBtwItems),
        ContainerN(
            backgroundColor:
                dark ? const Color.fromARGB(255, 149, 149, 149) : Color.fromARGB(255, 227, 227, 227),
            child: Padding(
                padding: const EdgeInsets.all(TSizes.md),
                child: Column(
                  children: [
                    Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Chu Chu",
                            style: TTextTheme.whiteTextTheme.bodyLarge),
                       
                        Text("24/07/2024",
                            style: TTextTheme.whiteTextTheme.bodyMedium),
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const ReadMoreText(
                        'Chu Chu chân thành Cảm ơn bạn đã bình luận. Những bình luận tích cực của khách hàng sẽ giúp cho Chu Chu ngày càng phát triển và có thể thâu tóm cả thế giới',
                        trimLines: 1,
                        trimMode: TrimMode.Line,
                        trimExpandedText: '  showless',
                        trimCollapsedText: ' show more',
                        moreStyle: TextStyle(
                            fontSize: 14.0,
                         
                            color: Colors.black),
                        lessStyle: TextStyle(
                            fontSize: 14.0,
                         
                            color: Colors.black)),
                  ],
                )
                )
                )
                 ,const SizedBox(height: TSizes.spaceBtwSections),
      ],
    );
  }
}
