import 'dart:async';
import 'dart:convert';
import 'package:fastfoodapp/admin/model/product.dart';
import 'package:fastfoodapp/model/product.dart' as auth;
import 'package:fastfoodapp/pagescustom/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/user.dart';
import 'package:fastfoodapp/admin/model/user.dart' as useradmin;

Future<bool> saveUser(User objUser) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String strUser = jsonEncode(objUser);
    prefs.setString('user', strUser);
    print("Luu thanh cong: $strUser");
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> logOut(BuildContext context) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user', '');
    print("Logout thành công");
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
        (route) => false);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

//
Future<User> getUser() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String strUser = pref.getString('user')!;
  return User.fromJson(jsonDecode(strUser));
}

Future<bool> saveProductFavourite(List<auth.ProductModel> objs) async {
  try {
    if (objs == null || objs.isEmpty) {
      // Không lưu gì nếu danh sách sản phẩm là null hoặc rỗng
      return false;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String strUser = jsonEncode(objs);
    await prefs.setString('productfavourite', strUser); // Sử dụng "await" để đợi lệnh lưu vào SharedPreferences hoàn tất
    print("Lưu thành công: $strUser");
    return true;
  } catch (e) {
    print("Lỗi khi lưu: $e");
    return false;
  }
}

Future<List<auth.ProductModel>> getProductFavourite() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? strUser = pref.getString('productfavourite'); // Thêm dấu "?" để xử lý trường hợp chuỗi JSON trống
  if (strUser != null && strUser.isNotEmpty) {
    List<dynamic> jsonList = jsonDecode(strUser);
    List<auth.ProductModel> productList = jsonList.map((item) => auth.ProductModel.fromJson(item)).toList();
    return productList;
  } else {
    return []; // Trả về một danh sách rỗng nếu không có sản phẩm yêu thích nào được lưu trữ
  }
}

Future<void> clearProductFavouriete()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('productfavourite');
}
