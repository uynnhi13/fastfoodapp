import 'dart:convert';
import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/model/user.dart';
import 'package:fastfoodapp/pagescustom/Profile/profile-edit.dart';
import 'package:fastfoodapp/widgetscustom/ItemAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  //Khi dùng tham số truyền vào phải khai báo biến trùng tên require
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
    //create style
    TextStyle mystyle = const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.amber,
    );
    return Scaffold(
        appBar: ItemAppBar(
          title: "Thông tin cá nhân",
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 30, bottom: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(user.imageURL!),
                  radius: 80,
                ),
                const SizedBox(
                  height: 15,
                ),
                itemProfile("NumberID", user.idNumber.toString(), Icons.key),
                itemProfile(
                    "Full Name", user.fullName.toString(), Icons.person),
                itemProfile(
                    "Phone Number", user.phoneNumber.toString(), Icons.person),
                itemProfile("Gender", user.gender.toString(), Icons.female),
                itemProfile("Birthday", user.birthDay.toString(), Icons.cake),
                itemProfile(
                    "School Year", user.schoolYear.toString(), Icons.school),
                itemProfile(
                    "School Key", user.schoolKey.toString(), Icons.school),
                itemProfile("Date Created", user.dateCreated.toString(),
                    Icons.date_range),

                SizedBox(height: 20,),
                SizedBox(
                  width: 350,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileEdit()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(15),
                        backgroundColor: color_background,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text(
                        'Chỉnh Sửa',
                        style: TextStyle(color: Colors.white,fontSize: 18),
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}

itemProfile(String title, String subTitle, IconData iconData) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 25.0),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 5),
              color: Colors.deepPurple.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 10)
        ]),
    child: ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      leading: Icon(iconData),
      tileColor: Colors.white,
    ),
  );
}
