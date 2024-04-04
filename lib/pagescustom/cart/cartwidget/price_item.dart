import 'package:fastfoodapp/config/text_them.dart';
import 'package:flutter/material.dart';

class PriceItem extends StatelessWidget {
  const PriceItem(
      {super.key,
      this.curencySign = '\vnd',
      this.maxLines = 1,
      this.lineThrough = false,
      this.isLarge = false,
      required this.price});

  final String curencySign, price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(price + curencySign,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: isLarge
            ? TTextTheme.whiteTextTheme.headlineMedium!
                .apply(decoration: lineThrough? TextDecoration.lineThrough:null):
                TTextTheme.whiteTextTheme.titleLarge!
                .apply(decoration: lineThrough? TextDecoration.lineThrough:null),);
            
  }
}
