import 'package:fastfoodapp/config/text_them.dart';
import 'package:fastfoodapp/pagescustom/product_review/widgets/total_rating.dart';
import 'package:flutter/material.dart';

class TotalRate extends StatelessWidget {
  const TotalRate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Text('4.9',
              textAlign: TextAlign.center,
              style: TTextTheme.whiteTextTheme.headlineLarge),
        ),
        Expanded(
          flex: 8,
          child: Column(
            children: [
              TotalReviews(text: '5', value: 1.0),
              TotalReviews(text: '4', value: 0.8),
              TotalReviews(text: '3', value: 0.5),
              TotalReviews(text: '2', value: 0.2),
              TotalReviews(text: '1', value: 0.1),
            ],
          ),
        )
      ],
    );
  }
}
