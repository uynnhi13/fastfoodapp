import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/data/sqlite.dart';
import 'package:fastfoodapp/model/cart.dart';
import 'package:fastfoodapp/model/product.dart';
import 'package:flutter/material.dart';

class ItemBottomNavBarProduct extends StatefulWidget {
  ProductModel product;
  ItemBottomNavBarProduct({super.key, required this.product});

  @override
  _ItemBottomNavBarProductState createState() =>
      _ItemBottomNavBarProductState();
}

class _ItemBottomNavBarProductState extends State<ItemBottomNavBarProduct> {

  _addToCart(ProductModel product) async {
    Cart productAdd = Cart(
        name: product.name,
        price: product.price,
        img: product.imgURL,
        des: product.desc,
        count: 1,
        productID: product.id!);
    await DatabaseHelper().addProduct(productAdd);
    // Hiển thị SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Đã thêm ${product.name} vào giỏ hàng',
          style: const TextStyle(fontSize: 18),
        ),
        duration: Duration(seconds: 2),
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 300),
        padding: const EdgeInsets.symmetric(
            vertical: 20, horizontal: 16), // Thiết lập padding
        shape: RoundedRectangleBorder(
          // Thiết lập shape
          borderRadius: BorderRadius.circular(8),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor:
            color_background, // Đặt thời gian hiển thị SnackBar là 2 giây
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: color_background,
      height: 180,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          //price+quantity
          Row(
            //chỉnh vị trí các phần tử
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //price
              Text(
                "90.000đ",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
          const SizedBox(
            height: 25,
          ),

          //add cart bottom
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () async {
                  await _addToCart(widget.product);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Color.fromRGBO(242, 213, 211, 0.5),
                ),
                child: const Text(
                  'Thêm vào giỏ hàng',
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ],
      ),
    ])
    );
}
}