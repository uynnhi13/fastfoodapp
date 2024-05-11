import 'package:fastfoodapp/config/sizes.dart';
import 'package:fastfoodapp/config/text_them.dart';
import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/pagescustom/address/showaddress.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/section_heading.dart';
import 'package:flutter/material.dart';

class AddresssScreen extends StatelessWidget {
  final String address;
  const AddresssScreen({
    super.key, required this.address,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         SectionHeading(
          title: 'Địa chỉ ',
          buttonTitle: 'Thay đổi',
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder:(context) => const showAdr(),));
          },
        ),
        Row(
          children: [
            const Icon(Icons.location_history,
                color: color_background, size: 16),
            const SizedBox(
              width: TSizes.spaceBtwItems / 2,
            ),
            Expanded(
                child: Text("Địa chỉ: $address",
                    style: TTextTheme.whiteTextTheme.bodyLarge,
                    softWrap: true)),
          ],
        )
      ],
    );
  }
}
