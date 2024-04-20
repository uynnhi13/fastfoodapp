import 'package:fastfoodapp/config/sizes.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/card_item_adrm.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/cart_item.dart';
import 'package:flutter/material.dart';

class CartItemsO extends StatelessWidget {
  const CartItemsO({super.key, this.showAddRemoveButtons = true});

  final showAddRemoveButtons;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => SizedBox(height: TSizes.spaceBtwSections),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [
          const CartItem(),
          if (showAddRemoveButtons)
            const SizedBox(height: TSizes.spaceBtwItems),
          if (showAddRemoveButtons)
            const Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 70,
                    ),
                    CardItemAddRemove(),
                  ],
                ),
                
              ],
            )
        ],
      ),
    );
  }
}
