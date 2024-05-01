import 'package:fastfoodapp/adminspace/page/category/category_add.dart';
import 'package:fastfoodapp/adminspace/page/category/category_data.dart';
import 'package:fastfoodapp/adminspace/widget/appbar.dart';
import 'package:fastfoodapp/const.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarAd(title: "Category List"),
      body: Center(
      child: CategoryBuilder()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
            .push(
              MaterialPageRoute(
                builder: (context) => const CategoryAdd(),
                fullscreenDialog: true,
              ),
            )
            .then((_)=> setState(() {},));
        },
        backgroundColor: color_background,
        tooltip: 'Add New',
        child: const Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}