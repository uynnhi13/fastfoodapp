import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:fastfoodapp/config/colors.dart';
import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/data/sharepre.dart';
import 'package:fastfoodapp/data/sqlite.dart';
import 'package:fastfoodapp/model/cart.dart';
import 'package:fastfoodapp/model/product.dart';
import 'package:fastfoodapp/pagescustom/product_review/review.dart';
import 'package:fastfoodapp/widgetscustom/ItemAppBar.dart';
import 'package:fastfoodapp/widgetscustom/NavBarProduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatefulWidget {
  final ProductModel product;

  const ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {

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

  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListFavo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ItemAppBar(title: widget.product.name),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: Image.network(
              widget.product.imgURL,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                      bottom: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.product.name,
                                style: const TextStyle(
                                    color: color_background,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                NumberFormat('#,##0')
                                    .format(widget.product.price),
                                style: const TextStyle(
                                    color: color_6,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Handle favorite button action here
                          },
                          icon: const Icon(
                            Icons.favorite_border,
                            color: color_background,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemSize: 20,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4),
                          itemBuilder: (context, _) => const Icon(
                            Icons.favorite,
                            color: color_background,
                          ),
                          onRatingUpdate: (index) {},
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProductReview()),
                            );
                          },
                          child: const Row(
                            children: [
                              Text(
                                "(999+ Bình luận)",
                                style: TextStyle(
                                    fontSize: 14, color: color_background),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                                color: color_background,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ReadMoreText(
                      widget.product.desc,
                      style: const TextStyle(fontSize: 16),
                      trimLines: 3,
                      trimMode: TrimMode.Line,
                      trimExpandedText: '(ẩn)',
                      trimCollapsedText: '(xem thêm)',
                      moreStyle: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: color_background),
                      lessStyle: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: color_background),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
