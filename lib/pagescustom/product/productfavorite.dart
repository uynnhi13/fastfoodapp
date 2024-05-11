import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/data/sharepre.dart';
import 'package:fastfoodapp/model/product.dart';
import 'package:fastfoodapp/pagescustom/product/ItemsWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductFavorite extends StatefulWidget {
  const ProductFavorite({super.key});

  @override
  State<ProductFavorite> createState() => _ProductFavoriteState();
}

class _ProductFavoriteState extends State<ProductFavorite> {

List<ProductModel> lsProductFavo = [];

  Future<void> getListFavo() async {
    var lstam = await getProductFavourite();
    setState(() {
      lsProductFavo = lstam;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListFavo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(16, 0, 0, 0)
          ,
          borderRadius: BorderRadius.circular(16)
        ),
        child:  ItemsWidget(
                  products: lsProductFavo,
                ),
      )
    );
  }
}