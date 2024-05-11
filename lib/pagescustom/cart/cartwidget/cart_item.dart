import 'package:fastfoodapp/config/image_strings.dart';
import 'package:fastfoodapp/config/sizes.dart';
import 'package:fastfoodapp/config/text_them.dart';
import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/model/cart.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/brand.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/image_container.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/price_item.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/text_product.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartItem extends StatefulWidget {
  final Cart product;

  const CartItem({Key? key, required this.product}) : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ImageContainerN(
            imgUrl: widget.product.img,
            width: 80,
            height: 80,
            padding: EdgeInsets.all(TSizes.sm),
          ),
          const SizedBox(width: TSizes.spaceBtwItems),
          SizedBox(
            width: 180,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    widget.product.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Text("Số lượng: ${widget.product.count}",
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          PriceItem(
            price: NumberFormat('#,##0').format(widget.product.price),
          ),
        ],
      ),
    );
  }
}
