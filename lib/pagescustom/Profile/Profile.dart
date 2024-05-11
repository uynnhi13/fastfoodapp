import 'dart:convert';

import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/model/user.dart';
import 'package:fastfoodapp/pagescustom/InforPage.dart';
import 'package:fastfoodapp/pagescustom/Profile/profile_detail.dart';
import 'package:fastfoodapp/pagescustom/address/showaddress.dart';
import 'package:fastfoodapp/pagescustom/orders_history/history_screen.dart';
import 'package:fastfoodapp/pagescustom/product/product_detail.dart';
import 'package:fastfoodapp/pagescustom/auth/login.dart';
import 'package:fastfoodapp/pagescustom/Profile/profile-edit.dart';
import 'package:fastfoodapp/pagescustom/product/productfavorite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User user = User.userEmpty();
  getDataUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String strUser = pref.getString('user')!;

    user = User.fromJson(jsonDecode(strUser));
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getDataUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(user.imageURL!),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              user.fullName!,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileEdit()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    backgroundColor: color_background,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            SizedBox(height: 20),
            itemProfile(
              'Thông tin cá nhân',
              Icons.person,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Detail()),
                );
              },
            ),
            SizedBox(height: 10),
            itemProfile(
              'Về Chúng Tôi',
              CupertinoIcons.info,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InforPage()),
                );
              },
            ),
            const SizedBox(height: 10),
            itemProfile(
              'Món ăn yêu thích',
              Icons.favorite,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductFavorite()),
                );
              },
            ),
            SizedBox(height: 10),
            itemProfile(
              'Đăng xuất',
              Icons.logout,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

typedef void OnIconPressed();
itemProfile(String title, IconData iconData, OnIconPressed onIconPressed) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 5),
              color: Colors.deepOrange.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 10)
        ]),
    child: ListTile(
      title: Text(title),
      leading: Icon(iconData),
      trailing: IconButton(
        icon: Icon(Icons.arrow_forward, color: Colors.grey),
        onPressed: onIconPressed,
      ),
      tileColor: Colors.white,
    ),
  );
}
