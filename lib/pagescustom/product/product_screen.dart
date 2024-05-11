import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/model/product.dart';
import 'package:fastfoodapp/pagescustom/product_review/review.dart';
import 'package:fastfoodapp/widgetscustom/ItemAppBar.dart';
import 'package:fastfoodapp/pagescustom/product/ItemsWidget.dart';
import 'package:fastfoodapp/widgetscustom/NavBarProduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ListProductByIDScreen extends StatelessWidget {
  final List<ProductModel> products;
  final String titleCate;

  const ListProductByIDScreen({Key? key, required this.products, required this.titleCate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ItemAppBar(title: titleCate),
      backgroundColor: const Color(0xFFEDECF2),
      body: Container(
        padding: EdgeInsets.only(top: 15),
        child: ItemsWidget(products: products)
        )
    );
  }
}
