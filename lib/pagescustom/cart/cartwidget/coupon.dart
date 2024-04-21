
import 'package:fastfoodapp/config/sizes.dart';
import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/pagescustom/product_review/widgets/container.dart';
import 'package:flutter/material.dart';

class Coupon extends StatelessWidget {
  const Coupon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerN(
      showBorder: true,
      backgroundColor: color_1,
      padding: const EdgeInsets.only(
          top: TSizes.sm,
          bottom: TSizes.sm,
          left: TSizes.sm,
          right: TSizes.sm),
      child: Row(
        children: [
          const Flexible(
              child: TextField(
            decoration: InputDecoration(
                hintText: 'Nhap ma vao day ',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none),
          )),
          SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: (){},
                style:ElevatedButton.styleFrom(backgroundColor: color_background)
                ,child: Text('Apply',style:const TextStyle(color: color_1),),
              ))
        ],
      ),
    );
  }
}