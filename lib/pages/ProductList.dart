// ignore: file_names
import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/widgets/CategoriesWidget.dart';
import 'package:fastfoodapp/widgets/HomeAppBar.dart' as hom_app_bar;
import 'package:fastfoodapp/widgets/ItemsWidget.dart' as item_widget;
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          hom_app_bar.HomeAppBar(),
          Container(
            // temporary height
            //height: 500,
            padding: const EdgeInsets.only(top: 15),
            decoration: const BoxDecoration(
              color: background,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                // Container(
                //   margin: const EdgeInsets.symmetric(horizontal: 15),
                //   padding: const EdgeInsets.symmetric(horizontal: 15),
                //   height: 50,
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(30),
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Container(
                //           margin: const EdgeInsets.only(left: 5),
                //           height: 50,
                //           width: 300,
                //           child: TextFormField(
                //             decoration: const InputDecoration(
                //               border: InputBorder.none,
                //               hintText: "Search here ...",
                //             ),
                //           )),
                //       const Icon(
                //         Icons.search,
                //         size: 27,
                //         color: color_background,
                //       ),
                //     ],
                //   ),
                // ),
                // Container(
                //   margin: const EdgeInsets.symmetric(
                //     vertical: 20,
                //     horizontal: 20,
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       Container(
                //         alignment: Alignment.centerLeft,
                //         child: const Text(
                //           'Category',
                //           style: TextStyle(
                //               fontSize: 20,
                //               fontWeight: FontWeight.bold,
                //               color: color_background),
                //         ),
                //       ),
                //       // const Spacer(),
                //       // const Icon(Icons.more_vert)

                //       GestureDetector(
                //         // When the child is tapped, show a snackbar.
                //         onTap: () {
                //           const snackBar = SnackBar(content: Text('Tap'));

                //           ScaffoldMessenger.of(context).showSnackBar(snackBar);
                //         },
                //         // The custom button
                //         child: const Icon(Icons.more_vert),
                //       )
                //     ],
                //   ),
                // ),

                CategoriesWidget(),

                //item
                Container(
                  alignment: Alignment.centerLeft,
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: const Text(
                    'Danh sách sản phẩm',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: color_background),
                  ),
                ),

                item_widget.ItemsWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
