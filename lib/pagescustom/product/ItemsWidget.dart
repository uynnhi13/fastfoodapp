import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/data/sharepre.dart';
import 'package:fastfoodapp/data/sqlite.dart';
import 'package:fastfoodapp/model/cart.dart';
import 'package:fastfoodapp/model/product.dart';
import 'package:fastfoodapp/pagescustom/product/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemsWidget extends StatefulWidget {
  final List<ProductModel> products;

  const ItemsWidget({Key? key, required this.products}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ItemsWidgetState createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  List<ProductModel> lsProductFavo = [];

  Future<void> getListFavo() async {
    var lstam = await getProductFavourite();
    setState(() {
      lsProductFavo = lstam;
    });
  }

  Future<void> addFavoris(ProductModel product) async {
    if (!lsProductFavo.any((element) => element.id == product.id)) {
      lsProductFavo.add(product);
      var test = await saveProductFavourite(lsProductFavo);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Đã thêm ${product.name} vào yêu thích',
            style: const TextStyle(fontSize: 18),
          ),
          duration: Duration(seconds: 1),
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
      setState(() {});
    } else {
      lsProductFavo.removeWhere((item) => item.id == product.id);

      var test = saveProductFavourite(lsProductFavo);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'đã xoá ${product.name} khỏi danh sách yêu thích',
            style: const TextStyle(fontSize: 18),
          ),
          duration: Duration(seconds: 1),
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
      setState(() {});
    }
  }

  bool checkFavo(ProductModel product) {
    if (lsProductFavo.any((element) => element.id == product.id)) {
      return true;
    }

    return false;
  }

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
    getListFavo();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.products.isEmpty) {
      // Nếu danh sách sản phẩm rỗng, hiển thị thông báo
      return const Center(
        child: Text(
          'Không có sản phẩm nào.',
          style: TextStyle(fontSize: 16),
        ),
      );
    }
    return GridView.count(
      childAspectRatio: 0.68,
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        for (int i = 0; i < widget.products.length; i++)
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetail(product: widget.products[i]),
                          ));
                    },
                    child: imageInput(widget.products[i].imgURL, 100)),
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.products[i].name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 155, 19, 32),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        NumberFormat('#,##0').format(widget.products[i].price),
                        style: const TextStyle(
                            color: color_background,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.products[i].desc,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 155, 19, 32),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            addFavoris(widget.products[i]);
                          },
                          icon: checkFavo(widget.products[i])
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors
                                      .red, // Thay đổi màu của biểu tượng thành màu đỏ
                                )
                              : Icon(
                                  Icons.favorite_border,
                                  color: Color.fromARGB(255, 155, 19, 32),
                                ),
                        ),
                        Container(
                            height: 40,
                            width: 40,
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 155, 19, 32),
                                borderRadius: BorderRadius.circular(25)),
                            child: IconButton(
                                iconSize: 15,
                                onPressed: () async {
                                  _addToCart(widget.products[i]);
                                  setState(() {});
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ))),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
