import 'package:fastfoodapp/config/sizes.dart';
import 'package:fastfoodapp/config/text_them.dart';
import 'package:flutter/material.dart';

class Billing extends StatelessWidget {
  const Billing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Tổng tiền ", style: TTextTheme.whiteTextTheme.bodyLarge),
            Text("200.000vnd", style: TTextTheme.whiteTextTheme.bodyMedium)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Phí vận chuyển ",
                style: TTextTheme.whiteTextTheme.bodyLarge),
            Text("20.000vnd", style: TTextTheme.whiteTextTheme.bodyMedium)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Thuế", style: TTextTheme.whiteTextTheme.bodyLarge),
            Text("10.000vnd", style: TTextTheme.whiteTextTheme.bodyMedium)
          ],
        ),
      ],
    );
  }
}
