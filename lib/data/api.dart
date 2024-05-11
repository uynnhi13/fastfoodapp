import 'package:dio/dio.dart';
import 'package:fastfoodapp/admin/data/sharepre.dart';
import 'package:fastfoodapp/admin/model/register.dart';
import 'package:fastfoodapp/model/bill.dart';
import 'package:fastfoodapp/model/cart.dart';
import 'package:fastfoodapp/model/category.dart';
import 'package:fastfoodapp/model/product.dart';
import 'package:fastfoodapp/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fastfoodapp/admin/model/user.dart' as userd;
import 'package:fastfoodapp/admin/data/api.dart' as apid;

class API {
  final Dio _dio = Dio();
  String baseUrl = "https://huflit.id.vn:4321";
  String stheader =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiMDk4NDAxMDMwMiIsIklEIjoiMjBESDExMjEyMyIsImp0aSI6ImI3ODgzOTU0LTBkZmItNDQ0MC1hNDJiLWI2MjE2MTM1NzhiZiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlN0dWRlbnQiLCJleHAiOjE3MjE5MjI1MjZ9.VDQR7-UsUqiJtIGdoVc4Z8u72USYlg-PXyKPsyXIY2M";

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

  //ĐĂNG NHẬP VÀO ADMIN ĐỂ LẤY DỮ LIỆU
  Future<String> loginAdmin() async {
    try {
      final body = FormData.fromMap(
          {'AccountID': '20DH1121234', 'Password': 'Leuyennhi132002'});
      Response res = await api.sendRequest.post('/Auth/login',
          options: Options(headers: header('no token')), data: body);
      SharedPreferences pref = await SharedPreferences.getInstance();
      if (res.statusCode == 200) {
        final tokenData = res.data['data']['token'];
        pref.setString('tokenAdmin', tokenData);
        print("ok login admin");
        return tokenData;
      } else {
        return "login fail admin";
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

  Future<String> register(Signup user) async {
    try {
      final body = FormData.fromMap({
        "numberID": user.numberID,
        "accountID": user.accountID,
        "fullName": user.fullName,
        "phoneNumber": user.phoneNumber,
        "imageURL": user.imageUrl,
        "birthDay": user.birthDay,
        "gender": user.gender,
        "schoolYear": user.schoolYear,
        "schoolKey": user.schoolKey,
        "password": user.password,
        "confirmPassword": user.confirmPassword
      });
      Response res = await api.sendRequest.post('/Student/signUp',
          options: Options(headers: header('no token')), data: body);
      if (res.statusCode == 200) {
        print("ok");
        return "ok";
      } else {
        print("fail");
        return "signup fail";
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

  Future<String> login(String accountID, String password) async {
    try {
      print("in ra account id $accountID và password $password");
      final body =
          FormData.fromMap({'AccountID': accountID, 'Password': password});
      Response res = await api.sendRequest.post('/Auth/login',
          options: Options(headers: header('no token')), data: body);
      SharedPreferences pref = await SharedPreferences.getInstance();
      if (res.statusCode == 200) {
        final tokenData = res.data['data']['token'];
        apid.API.token = tokenData;
        pref.setString('accountID', accountID);
        pref.setString('token', tokenData);
        print("ok login");
        return tokenData;
      } else {
        return "login fail";
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

  Future<User> current(String token) async {
    try {
      Response res = await api.sendRequest
          .get('/Auth/current', options: Options(headers: header(token)));

      var user = User.fromJson(res.data);

      userd.User tam = userd.User(
        idNumber: user.idNumber,
        accountId: user.accountId,
        fullName: user.fullName,
        phoneNumber: user.phoneNumber,
        imageURL: user.phoneNumber,
        birthDay: user.birthDay,
        gender: user.gender,
        schoolYear: user.schoolYear,
        schoolKey: user.schoolKey,
        dateCreated: user.dateCreated,
        status: user.status,
      );

      saveUser(tam);

      return User.fromJson(res.data);
    } catch (ex) {
      rethrow;
    }
  }

  // ignore: non_constant_identifier_names
  Future<bool> UpdateUser(String token, User user) async {
    try {
      final body = FormData.fromMap({
        'NumberID': user.idNumber,
        'FullName': user.fullName,
        'PhoneNumber': user.phoneNumber,
        'Gender': user.gender,
        'Birthday': user.birthDay,
        'SchoolYear':user.schoolYear,
        'SchoolKey':user.schoolKey,
        'ImageURL':user.imageURL,
      });
      print(body);
      Response res = await api.sendRequest.put('/Auth/updateProfile',
          options: Options(headers: header(token)), data: body);
      return true;
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

  //Xử Lý Category
  Future<List<CategoryModel>> getCategory(String token) async {
    try {
      Response res = await api.sendRequest.get(
        '/Category/getList',
        options: Options(headers: header(token)),
        queryParameters: {'accountID': '20DH1121234'},
      );
      if (res.statusCode == 200) {
        //Dữ liệu trả về là một danh sách các category
        List<dynamic> cateData = res.data;
        print(cateData);
        List<CategoryModel> cateList =
            cateData.map((item) => CategoryModel.fromMap(item)).toList();
        print("Đây là cateList: $cateList");
        return cateList;
      } else {
        //Nếu không thành công thì in ra lỗi và trả về một danh sách rỗng
        return [];
      }
    } catch (ex) {
      rethrow;
    }
  }

  Future<bool> addCategory(CategoryModel data, String token) async {
    try {
      final body = FormData.fromMap({
        'name': data.name,
        'description': data.desc,
        'imageURL': data.imgURLCate,
        'accountID': '20DH1121234'
      });
      Response res = await api.sendRequest.post('/addCategory',
          options: Options(headers: header(token)), data: body);
      if (res.statusCode == 200) {
        print("ok add category");
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

  Future<bool> updateCategory(
      int categoryID, CategoryModel data, String token) async {
    try {
      final body = FormData.fromMap({
        'id': categoryID,
        'name': data.name,
        'description': data.desc,
        'imageURL': data.imgURLCate,
        'accountID': '20DH1121234'
      });
      Response res = await api.sendRequest.put('/updateCategory',
          options: Options(headers: header(token)), data: body);
      if (res.statusCode == 200) {
        print("ok update category");
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

  Future<bool> removeCategory(int categoryID, String token) async {
    try {
      final body = FormData.fromMap(
          {'categoryID': categoryID, 'accountID': '20DH1121234'});
      Response res = await api.sendRequest.delete('/removeCategory',
          options: Options(headers: header(token)), data: body);
      if (res.statusCode == 200) {
        print("ok remove category");
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

  //XỬ LÝ PRODUCT
  Future<List<ProductModel>> getProductByID(String token, int cateID) async {
    try {
      Response res = await api.sendRequest.get(
        '/Product/getListByCatId',
        options: Options(headers: header(token)),
        queryParameters: {'accountID': '20DH1121234', 'categoryID': cateID},
      );
      if (res.statusCode == 200) {
        //Dữ liệu trả về là một danh sách các category
        List<dynamic> proData = res.data;
        print(proData);
        List<ProductModel> proList =
            proData.map((item) => ProductModel.fromMap(item)).toList();
        print("Đây là proList của category $cateID: $proList");
        return proList;
      } else {
        //Nếu không thành công thì in ra lỗi và trả về một danh sách rỗng
        return [];
      }
    } catch (ex) {
      rethrow;
    }
  }

  Future<List<ProductModel>> getProduct(String token) async {
    try {
      Response res = await api.sendRequest.get(
        '/Product/getList',
        options: Options(headers: header(token)),
        queryParameters: {'accountID': '20DH1121234'},
      );
      if (res.statusCode == 200) {
        //Dữ liệu trả về là một danh sách các category
        List<dynamic> proData = res.data;
        print(proData);
        List<ProductModel> proList =
            proData.map((item) => ProductModel.fromMap(item)).toList();
        print("Đây là proList: $proList");
        return proList;
      } else {
        //Nếu không thành công thì in ra lỗi và trả về một danh sách rỗng
        return [];
      }
    } catch (ex) {
      rethrow;
    }
  }

  Future<bool> addProduct(ProductModel data, String token) async {
    try {
      final body = FormData.fromMap({
        'name': data.name,
        'description': data.desc,
        'imageURL': data.imgURL,
        'Price': data.price,
        'CategoryID': data.categoryID
      });
      Response res = await api.sendRequest.post('/addProduct',
          options: Options(headers: header(token)), data: body);
      if (res.statusCode == 200) {
        print("ok add product");
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

  Future<bool> updateProduct(ProductModel data, String token) async {
    try {
      final body = FormData.fromMap({
        'id': data.id,
        'name': data.name,
        'description': data.desc,
        'imageURL': data.imgURL,
        'Price': data.price,
        'categoryID': data.categoryID,
        'accountID': '20DH1121234'
      });
      Response res = await api.sendRequest.put('/updateProduct',
          options: Options(headers: header(token)), data: body);
      if (res.statusCode == 200) {
        print("ok update product");
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

  Future<bool> removeProduct(int productID, String token) async {
    try {
      final body = FormData.fromMap(
          {'productID': productID, 'accountID': '20DH1121234'});
      Response res = await api.sendRequest.delete('/removeProduct',
          options: Options(headers: header(token)), data: body);
      print(res.statusCode);
      if (res.statusCode == 200) {
        print("ok remove product");
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

  Future<bool> addBill(List<Cart> products, String token) async {
    var list = [];
    try {
      for (int i = 0; i < products.length; i++) {
        list.add({
          'productID': products[i].productID,
          'count': products[i].count,
        });
      }
      Response res = await api.sendRequest.post('/Order/addBill',
          options: Options(headers: header(token)), data: list);
      if (res.statusCode == 200) {
        print("add bill ok");
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

  Future<List<BillModel>> getHistory(String token) async {
    try {
      Response res = await api.sendRequest
          .get('/Bill/getHistory', options: Options(headers: header(token)));
      return res.data
          .map((e) => BillModel.fromJson(e))
          .cast<BillModel>()
          .toList();
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

  Future<List<BillDetailModel>> getHistoryDetail(
      String billID, String token) async {
    try {
      Response res = await api.sendRequest.post('/Bill/getByID?billID=$billID',
          options: Options(headers: header(token)));
      return res.data
          .map((e) => BillDetailModel.fromJson(e))
          .cast<BillDetailModel>()
          .toList();
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }
}
