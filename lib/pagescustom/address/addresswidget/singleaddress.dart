import 'package:fastfoodapp/config/sizes.dart';
import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/pagescustom/product_review/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    return ContainerN(
      padding: EdgeInsets.all(TSizes.md),
        width: double.infinity,
        showBorder: true,
        backgroundColor: selectedAddress
            ? color_background.withOpacity(0.4)
            : Colors.transparent,
        borderColor: primarys,
        margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        child: Stack(
          children: [
            Positioned(
              right:5,top:0,
              child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
                  color: color_background),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(
              'Nguyen Anh Nhat ',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:
             TextStyle(
                  color: color_background,
                  fontSize: TSizes.md,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height:TSizes.sm/2),
            Text('0774799247',maxLines: 1,overflow: TextOverflow.ellipsis,),
             const SizedBox(height:TSizes.sm/2),
            Text('12/3 ấp 3 xã phú xuân huyện nhà bè ',softWrap: true,),

            
            ],)
          ],
        ));
  }
}
