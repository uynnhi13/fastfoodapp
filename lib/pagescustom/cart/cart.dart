import 'package:fastfoodapp/config/sizes.dart';

import 'package:fastfoodapp/pagescustom/cart/cartwidget/cart_items.dart';
import 'package:fastfoodapp/pagescustom/cart/order_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace), child: CartItems()),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder:
            (context)=> Orders()),);
          },
          child: const Text('Mua Hàng'),
        ),
      ),
    );
  }
}
