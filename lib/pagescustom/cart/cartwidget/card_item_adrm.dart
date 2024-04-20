
import 'package:fastfoodapp/config/sizes.dart';
import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/pagescustom/payment/payment_wiget/circularicon.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CardItemAddRemove extends StatelessWidget {
  const CardItemAddRemove({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
           mainAxisSize: MainAxisSize.min,
          children: [
            CircularIcon(
              icon: Iconsax.minus,
              width: 32,
              height: 32,
              size: TSizes.md,
              color: color_background,
              backgroundColor: color_1,
            ),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text('2',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
           
            CircularIcon(
              icon: Iconsax.add,
              width: 32,
              height: 32,
              size: TSizes.md,
              color: color_3,
              backgroundColor: color_4,
            ),

            
          ],
        );
  }
}
