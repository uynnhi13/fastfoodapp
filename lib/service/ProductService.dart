import 'dart:convert';
import 'dart:io';
import 'package:fastfoodapp/model/product.dart';
import 'package:path_provider/path_provider.dart';

class ProductService {
  ProductService() {}

  // Phương thức để lưu dữ liệu Product vào tệp JSON
  static Future<void> saveProduct(Product product) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/model/product.json');
    List<Product> products =
        await getProducts(); // Lấy danh sách sản phẩm hiện tại

    products.add(product); // Thêm sản phẩm mới vào danh sách

    // Ghi danh sách sản phẩm vào tệp JSON
    await file
        .writeAsString(jsonEncode(products.map((e) => e.toJson()).toList()));
    print("add succes");
  }

  // Phương thức để đọc dữ liệu từ tệp JSON và trả về danh sách sản phẩm
  static Future<List<Product>> getProducts() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/model/product.json');
      if (await file.exists()) {
        final jsonString = await file.readAsString();
        final jsonList = jsonDecode(jsonString) as List<dynamic>;
        // Chuyển đổi danh sách đối tượng JSON thành danh sách sản phẩm
        final products = jsonList.map((e) => Product.fromJson(e)).toList();
        return products;
      }
    } catch (e) {
      print('Error: $e');
    }
    return [];
  }
}
