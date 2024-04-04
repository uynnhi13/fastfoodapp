import 'package:fastfoodapp/config/enums.dart';
import 'package:fastfoodapp/config/sizes.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/brand_small.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BrandIcon extends StatelessWidget {
  const BrandIcon(
      {super.key,
      this.textColor,
      this.maxLines = 1,
      this.iconColor,
      this.brandTextSize = TextSizes.small,
      this.textAlign = TextAlign.center,
      required this.title});

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: BrandTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),
        const SizedBox(width: TSizes.xs),
        Icon(
          Iconsax.verify5,
          color: iconColor,
          size: TSizes.iconXs,
        ),
      ],
    );
  }
}
