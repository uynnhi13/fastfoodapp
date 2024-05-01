import 'package:fastfoodapp/adminspace/page/category/category_add.dart';
import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/data/helper/category_helper.dart';
import 'package:fastfoodapp/data/model/category.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class CategoryBuilder extends StatefulWidget {
  const CategoryBuilder({super.key});

  @override
  State<CategoryBuilder> createState() => _CategoryBuilderState();
}

class _CategoryBuilderState extends State<CategoryBuilder> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<List<CategoryModel>> _getCategorys() async {
    //Thêm vào 1 dòng dữ liệu nếu getdata không có hoặc chưa có db
    return await _databaseHelper.categories();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryModel>>(
      future: _getCategorys(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final itemCat = snapshot.data![index];
              return _buildCategory(itemCat, context);
            },
          ),
        );
      },
    );
  }

  Widget _buildCategory(CategoryModel breed, BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
                height: 80.0,
                width: 80.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage:
                      AssetImage('assets/admin/LogoCate.png'),
                )),
            const SizedBox(width: 20.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    breed.name,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(breed.description,
                  //sẽ xuống dòng nếu quá 1 hàng (maxlines )
                   overflow: TextOverflow.ellipsis,maxLines: 1,)
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    DatabaseHelper().deleteCategory(breed.id!);
                  });
                },
                icon: const Icon(
                  Icons.delete,
                  color: color_background,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context)
                        .push(
                          MaterialPageRoute(
                            builder: (context) => CategoryAdd(
                              isUpdate: true,
                              categoryModel: breed,
                            ),
                            fullscreenDialog: true,
                          ),
                        )
                        .then((_) => setState(() {}));
                  });
                },
                icon: Icon(
                  Icons.edit,
                  color: color_background,
                ))
          ],
        ),
      ),
    );
  }
}
