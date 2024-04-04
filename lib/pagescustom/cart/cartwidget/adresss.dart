import 'package:fastfoodapp/config/sizes.dart';
import 'package:fastfoodapp/config/text_them.dart';
import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/section_heading.dart';
import 'package:flutter/material.dart';

class Addresss extends StatelessWidget {
  const Addresss({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         SectionHeading(
          title: 'Địa chỉ ',
          buttonTitle: 'Thay đổi',
          onPressed: (){},
        ),
        Text("Anh Nhật", style: TTextTheme.whiteTextTheme.bodyLarge),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            const Icon(Icons.phone, color: color_background, size: 16),
            const SizedBox(
              width: TSizes.spaceBtwItems / 2,
            ),
            Text("0166295555", style: TTextTheme.whiteTextTheme.bodyLarge),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.location_history,
                color: color_background, size: 16),
            const SizedBox(
              width: TSizes.spaceBtwItems / 2,
            ),
            Expanded(
                child: Text("12/3 ấp 3 xã phú xuân huyện nhà bè ",
                    style: TTextTheme.whiteTextTheme.bodyLarge,
                    softWrap: true)),
          ],
        )
      ],
    );
  }
}
