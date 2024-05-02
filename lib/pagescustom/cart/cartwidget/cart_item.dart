import 'package:fastfoodapp/config/image_strings.dart';
import 'package:fastfoodapp/config/sizes.dart';
import 'package:fastfoodapp/config/text_them.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/brand.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/image_container.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/price_item.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/text_product.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ImageContainerN(
          imgUrl: TImages.productImage1,
          width: 60,
          height: 60,
          padding: EdgeInsets.all(TSizes.sm),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BrandIcon(title: 'Gà'),
            const Flexible(
              child: ProductTitleText(title: 'Gà chiên giòn ', maxLines: 1),
            ),
            Text("Gà rán giòn , nước ngọt ",
                style: TTextTheme.whiteTextTheme.bodySmall),
          ],
        ),
        const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: PriceItem(
                price: ' 200.000',
              ),
            ),
          ],
        )
      ],
    );
  }
}
