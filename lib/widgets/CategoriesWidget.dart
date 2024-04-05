import 'package:flutter/material.dart';

import 'package:fastfoodapp/model/Category.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {

  List<Category> models = [];

  @override
  void initState() {
    super.initState();
    for(int i = 1; i < 8; i++){
      models.add(Category(categoryID: i,categoryName: "Category $i"));
    }
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < models.length; i++)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/${models[i].categoryID}.png",
                    width: 40,
                    height: 40,
                  ),
                  Text(
                    '${models[i].categoryName}',
                    style:const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

