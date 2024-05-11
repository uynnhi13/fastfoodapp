// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:fastfoodapp/admin/model/product.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/user.dart';



Future<bool> saveUser(User objUser) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String strUser = jsonEncode(objUser);
    prefs.setString('user', strUser);
    print("Luu thanh cong: $strUser");

    User.model =await getUser();

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
