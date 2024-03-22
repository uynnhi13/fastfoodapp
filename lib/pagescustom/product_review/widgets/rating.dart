import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class start extends StatelessWidget {
  const start({
    super.key,
    required this.rating,
  });
  final double rating;
  @override
  Widget build(BuildContext context) {
    return  // Điều chỉnh giá trị theo ý muốn của bạn
       RatingBarIndicator(
        rating: rating,
        itemSize: 20,
        unratedColor: Colors.grey,
        itemBuilder: (_, __) => const Icon(
          Icons.star,
          color: Colors.yellow,
        ),
      );
   
  }
}
