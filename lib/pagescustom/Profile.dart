import 'package:fastfoodapp/const.dart';
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
          CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage(
              'images/avatar.png'),
          ),
          const SizedBox(height: 20),
          itemProfile('Name', 'Lê Uyển Nhi', Icons.person),
          const SizedBox(height: 10),
          itemProfile('Phone', '0984010302', Icons.phone),
          const SizedBox(height: 10),
          itemProfile('Address', 'abc Sư Vạn Hạnh Quận 10', CupertinoIcons.location),
          const SizedBox(height: 10),
          itemProfile('Email', 'leuyennhi132002@gmail.com', CupertinoIcons.mail),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (){}, 
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                primary: color_background,
              ),
              child: const Text('Edit Profile', style: TextStyle(color: Colors.white),)
            ),
          ),
        ],
      ),
      )
      
    );
  }
}

itemProfile(String title, String subtitle, IconData iconData){
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
              subtitle: Text(subtitle),
              leading: Icon(iconData),
              trailing: Icon(Icons.arrow_forward,color: Colors.grey),
              tileColor: Colors.white,
            ),
          );
}