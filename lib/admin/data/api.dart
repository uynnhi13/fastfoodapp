import 'dart:convert';

import 'package:fastfoodapp/admin/data/sharepre.dart';
import 'package:fastfoodapp/admin/model/history.dart';
import 'package:fastfoodapp/admin/model/product.dart';
import 'package:fastfoodapp/admin/model/productonbill.dart';
import 'package:fastfoodapp/admin/model/register.dart';
import 'package:fastfoodapp/admin/model/user.dart';
import 'package:fastfoodapp/admin/model/categorymodel.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class API {
  final Dio _dio = Dio();
  String baseUrl = "https://huflit.id.vn:4321";
  String accountID = '20DH1121234';

  static String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiMDM3NjM4MDE3NCIsIklEIjoiMjBkaDExMjE0MiIsImp0aSI6IjJkOGI3M2Q0LWMzZmUtNGY5Yy04MmY4LTlhNzMyNTM4N2UwOCIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlN0dWRlbnQiLCJleHAiOjE3MjIzNTQ5MDF9.eb6vZCdpSzcNfwsXWO1kJPCkko5oicdL10oNHwY8AN0';

  API() {
    _dio.options.baseUrl = "$baseUrl/api";
  }

  Dio get sendRequest => _dio;
}

class APIRepository {
  API api = API();

  Map<String, dynamic> header(String token) {
    return {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Authorization': 'Bearer $token'
    };
  }

  //get list category
  Future<List<CategoryModel>> getList() async {
    try {
      final model = User.model;
      if (model != null) {
        //final body = FormData.fromMap({'accountID': model.accountId.toString().trim()});

        Response res = await api.sendRequest.get('/Category/getList',
            options: Options(headers: header(API.token)),
            queryParameters: {'accountID': model.accountId});

        if (res.statusCode == 200) {
          //var data = res.data as List;
          List<dynamic> jsonData = res.data as List; // Giả định `res.data` là một List.

          List<CategoryModel> categories = jsonData
              .map((item) =>
                  CategoryModel.fromJson(item))
              .toList();
          return categories;
        } else {
          throw Exception('Failed to load categories');
        }
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

  Future<bool> addCategory(CategoryModel model) async {
    try {
      final body = FormData.fromMap({
        'Name': model.name,
        'Description': model.description,
        'ImageURL': model.imageURL,
        'AccountID': model.accountID
      });

      Response res = await api.sendRequest.post(
        '/addCategory',
        options: Options(headers: header(API.token)),data: body
      );
      if (res.statusCode == 200) {
        print('Tạo thành công category');
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

  Future<bool> deleteCategory(int categoryID ) async {
    try {
      final body = FormData.fromMap({
        'categoryID': categoryID,
        'accountID': User.model.accountId
      });

      Response res = await api.sendRequest.delete(
        '/removeCategory',
        options: Options(headers: header(API.token)),data: body
      );
      if (res.statusCode == 200) {
        print('Tạo thành công category');
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

  Future<bool> editCategory(CategoryModel model) async {
    try {
      final body = FormData.fromMap({
        'id': model.id,
        'Name': model.name,
        'Description': model.description,
        'ImageURL': model.imageURL,
        'AccountID': User.model.accountId
      });

      Response res = await api.sendRequest.put(
        '/updateCategory',
        options: Options(headers: header(API.token)),data: body
      );
      if (res.statusCode == 200) {
        print('Chỉnh xửa thành công category');
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  //get product
  Future<List<ProductModel>> getListProduct() async {
    try {
      final model = User.model;
      if (model != null) {
        //final body = FormData.fromMap({'accountID': model.accountId.toString().trim()});
        Response res = await api.sendRequest.get('/Product/getList',
            options: Options(headers: header(API.token)),
            queryParameters: {'accountID': model.accountId});

        if (res.statusCode == 200) {
          //var data = res.data as List;
          var jsonData = res.data as List; // Giả định `res.data` là một List.

          List<ProductModel> products = jsonData
              .map((item) =>
                  ProductModel.fromMap(item))
              .toList();
          return products;
        } else {
          throw Exception('Failed to load categories');
        }
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }
  Future<bool> deleteProduct(int productID ) async {
    try {
      final body = FormData.fromMap({
        'productID': productID,
        'accountID': User.model.accountId
      });

      Response res = await api.sendRequest.delete(
        '/removeProduct',
        options: Options(headers: header(API.token)),data: body
      );
      if (res.statusCode == 200) {
        print('xoá thành công product');
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

  Future<bool> addProduct(ProductModel model) async {
    try {
      final body = FormData.fromMap({
        'Name': model.name,
        'Description': model.desc,
        'ImageURL': model.imgURL,
        'Price': model.price,
        'CategoryID': model.categoryID
      });

      Response res = await api.sendRequest.post(
        '/addProduct',
        options: Options(headers: header(API.token)),data: body
      );
      if (res.statusCode == 200) {
        print('Tạo thành công category');
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

  Future<bool> editProduct(ProductModel model) async {
    try {
      final body = FormData.fromMap({
        'id': model.id,
        'Name': model.name,
        'Description': model.desc,
        'ImageURL': model.imgURL,
        'Price': model.price,
        'CategoryID': model.categoryID,
        'accountID': User.model.accountId
      });

      Response res = await api.sendRequest.put(
        '/updateProduct',
        options: Options(headers: header(API.token)),data: body
      );
      if (res.statusCode == 200) {
        print('Chỉnh xửa thành công product');
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      return false;
    }
  }
  // bill
  
  Future<List<HistoryModel>> getHistory() async {
    try {
      final model = User.model;
      if (model != null) {
        Response res = await api.sendRequest.get('/Bill/getHistory',
            options: Options(headers: header(API.token)) );

        if (res.statusCode == 200) {
          //var data = res.data as List;
          List<dynamic> jsonData = res.data as List; // Giả định `res.data` là một List.

          List<HistoryModel> history = jsonData
              .map((item) =>
                  HistoryModel.fromJson(item))
              .toList();
          return history;
        } else {
          throw Exception('Failed to load categories');
        }
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

  Future<List<ProductOnBill>> getBillByID(String billID) async {
    try {
      final model = User.model;

      final body = FormData.fromMap({
        'billID': billID.trim().toString(),
      });

      if (model != null) {
        Response res = await api.sendRequest.post('/Bill/getByID',
            options: Options(headers: header(API.token)),queryParameters: {'billID': billID.trim().toString()});
        if (res.statusCode == 200) {
          List<dynamic> jsonData = res.data as List; 

          List<ProductOnBill> productonbill = jsonData
              .map((item) =>
                  ProductOnBill.fromJson(item))
              .toList();
          return productonbill;
        } else {
          throw Exception('Failed to load ProductOnBill');
        }
      } else {
        throw Exception('Failed to load ProductOnBill');
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }
}
