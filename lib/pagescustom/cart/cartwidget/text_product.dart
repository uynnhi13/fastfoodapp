import 'package:fastfoodapp/config/text_them.dart';
import 'package:flutter/material.dart';

class ProductTitleText extends StatelessWidget {
  const ProductTitleText(
      {super.key,
      this.smallSize = false,
      this.maxLines = 2,
      this.textAlign = TextAlign.left,
      required this.title});

  final String title;
  final int maxLines;
  final bool smallSize;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallSize
          ? TTextTheme.whiteTextTheme.labelLarge
          : TTextTheme.whiteTextTheme.titleSmall!,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}
