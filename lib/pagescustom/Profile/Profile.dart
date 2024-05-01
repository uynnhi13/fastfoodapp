
import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/pagescustom/ContactPage.dart';
import 'package:fastfoodapp/pagescustom/InforPage.dart';
import 'package:fastfoodapp/pagescustom/Product1.dart';
import 'package:fastfoodapp/pagescustom/Profile/profile-edit.dart';
import 'package:fastfoodapp/pagescustom/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
        children: [
          const CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage(
              'assets/images/avatar/avatar.png'),
          ),
          const SizedBox(height: 10,),
          Text("Uyển Nhi Lê",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          const SizedBox(height: 20),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: (){
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileEdit()),
              );
              }, 
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15), backgroundColor: color_background,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)
                ),
              ),
              child: const Text('Edit Profile', style: TextStyle(color: Colors.white),)
            ),
          ),
          const SizedBox(height: 20),
          itemProfile('Cài đặt',  Icons.settings,(){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Product1()),
              );
            },),
          const SizedBox(height: 10),
          itemProfile('Lịch sử đơn hàng', Icons.wallet,(){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Product1()),
              );
            },),
          const SizedBox(height: 10),
          itemProfile('Về Chúng Tôi', CupertinoIcons.info,(){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InforPage()),
              );
            },),
          const SizedBox(height: 10),
          itemProfile('Đăng xuất', Icons.logout,(){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },),
        ],
      ),
      )
    );
  }
}
typedef void OnIconPressed();
itemProfile(String title, IconData iconData, OnIconPressed onIconPressed){
    return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 5),
                  color: Colors.deepOrange.withOpacity(.2),
                  spreadRadius: 2,
                  blurRadius: 10
                )
              ]
            ),
            child: ListTile(
              title: Text(title),
              leading: Icon(iconData),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward, color: Colors.grey),
                onPressed: onIconPressed,),
              tileColor: Colors.white,
            ),
          );
}