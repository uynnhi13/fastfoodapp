import 'package:fastfoodapp/data/api.dart';
import 'package:fastfoodapp/model/product.dart';
import 'package:fastfoodapp/widgetscustom/BannerWidget.dart';
import 'package:fastfoodapp/widgetscustom/CategoriesWidget.dart';
import 'package:fastfoodapp/widgetscustom/HomeAppBar.dart';
import 'package:fastfoodapp/pagescustom/product/ItemsWidget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ProductModel> _products = []; // Danh sách sản phẩm
  List<ProductModel> allProduct = [];
  @override
  void initState() {
    super.initState();
    _loadProducts(); // Gọi phương thức để tải danh sách sản phẩm
  }

  SeachNameProduct(String value) {
    var tam = allProduct
        .where((element) => element.name
            .toUpperCase()
            .trim()
            .contains(value.toUpperCase().trim()))
        .toList();
    setState(() {
      _products = tam;
    });
  }

  Future<void> _loadProducts() async {
    // Gọi API để lấy danh sách sản phẩm
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<ProductModel> products = await APIRepository()
          .getProduct(prefs.getString('tokenAdmin').toString());
      setState(() {
        _products = products; // Cập nhật danh sách sản phẩm
        allProduct = products;
      });
    } catch (error) {
      print("Error loading products: $error");
      // Xử lý lỗi nếu có
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            //height: 500,
            padding: const EdgeInsets.only(top: 15),
            decoration: const BoxDecoration(
              color: Color(0xFFEDECF2),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          height: 50,
                          width: 300,
                          child: TextFormField(
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search here..."),
                            onFieldSubmitted: (value) {
                              // Xử lý khi người dùng ấn nút enter hoặc nút tìm kiếm trên bàn phím
                              SeachNameProduct(value);
                              // Thực hiện các thao tác tìm kiếm dựa trên giá trị value ở đây
                            },
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.search,
                          size: 27,
                          color: Color.fromARGB(255, 155, 19, 32),
                        )
                      ],
                    ),
                  ),

                  Container(
                    //alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 10,
                    ),
                  ),
                  BannerWidget(),
                  //categories
                  Container(
                    //alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 10,
                    ),
                    child: const Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 155, 19, 32),
                      ),
                    ),
                  ),

                  //categories Widget
                  const CategoryBuilder(),

                  //item
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: const Text('Best selling',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 155, 19, 32),
                        )),
                  ),

                  //Items Widget
                  ItemsWidget(
                    products: _products,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
