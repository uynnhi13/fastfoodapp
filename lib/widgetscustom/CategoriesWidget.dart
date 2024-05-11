// ignore: file_names
import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/data/api.dart';
import 'package:fastfoodapp/model/category.dart';
import 'package:fastfoodapp/model/product.dart';
import 'package:fastfoodapp/pagescustom/product/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryBuilder extends StatefulWidget {
  // ignore: use_super_parameters
  const CategoryBuilder({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CategoryBuilderState createState() => _CategoryBuilderState();
}

class _CategoryBuilderState extends State<CategoryBuilder> {
  Future<List<CategoryModel>> _getCategories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await APIRepository()
        .getCategory(prefs.getString('tokenAdmin').toString());
  }


  void _onCategorySelected(int category, String name) async {
    // Call API to get products based on category
     SharedPreferences prefs = await SharedPreferences.getInstance();
    List<ProductModel> products =
        await APIRepository().getProductByID(prefs.getString('tokenAdmin').toString(),category);

    // Call the callback to pass the products list to the parent widget
    Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ListProductByIDScreen(products: products, titleCate: name,),
    ),
  );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        // Kiểm tra nếu snapshot.data là null hoặc rỗng
        if (snapshot.data == null || snapshot.data!.isEmpty) {
          // Trả về một widget khác, hoặc một widget trống tùy thuộc vào yêu cầu của bạn
          return Container();
        }
        return SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final itemCat = snapshot.data![index];
              return Column(
                children: [
                  Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 155, 19, 32),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          _onCategorySelected(itemCat.id!,itemCat.name);
                        },
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(10), // Độ cong của các góc
                          child: Image.network(
                            itemCat.imgURLCate,
                            fit: BoxFit.cover,
                            height: 80,
                            width: 80,
                          ),
                        ),
                      )
                    ),
                    const SizedBox(height: 8,),
                    Text(itemCat.name,
                    style: const TextStyle(fontWeight: FontWeight.bold,
                    fontSize:15, color: color_background ),),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
