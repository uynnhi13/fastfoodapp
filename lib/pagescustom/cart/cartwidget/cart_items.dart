import 'package:fastfoodapp/config/sizes.dart';
import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/data/sqlite.dart';
import 'package:fastfoodapp/model/cart.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/card_item_adrm.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/cart_item.dart';
import 'package:flutter/material.dart';

class CartItems extends StatefulWidget {
  const CartItems({Key? key}) : super(key: key);

  @override
  _CartItemsState createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  late Future<List<Cart>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = _getProducts();
  }

  Future<List<Cart>> _getProducts() async {
    return DatabaseHelper().products();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Cart>>(
      future: _productsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error loading data'),
          );
        } else if (snapshot.hasData) {
          final List<Cart> products = snapshot.data!;
          return ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwSections),
            itemCount: products.length,
            itemBuilder: (_, index) => Column(
              children: [
                CartItem(product: products[index]), 
              ],
            ),
          );
        } else {
          return const Center(
            child: Text('No data available'),
          );
        }
      },
    );
  }
}
