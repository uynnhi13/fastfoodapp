import 'package:fastfoodapp/config/enums.dart';
import 'package:fastfoodapp/config/text_them.dart';
import 'package:flutter/material.dart';

class BrandTitleText extends StatelessWidget {
  const BrandTitleText(
      {super.key,
      this.color,
      this.maxLines = 1,
      this.brandTextSize = TextSizes.small,
      this.textAlign = TextAlign.center,
      required this.title});

  final String title;
  final int maxLines;
  final Color? color;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,

      style: brandTextSize==TextSizes.small? TTextTheme.whiteTextTheme.labelMedium!.apply(color: color):brandTextSize==TextSizes.medium?
      TTextTheme.whiteTextTheme.bodyLarge!.apply(color: color):brandTextSize==TextSizes.large?
      TTextTheme.whiteTextTheme.titleLarge!.apply(color: color):TTextTheme.whiteTextTheme.bodyMedium!.apply(color: color)
    );
  }
}
