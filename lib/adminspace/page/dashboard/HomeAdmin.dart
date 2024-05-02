import 'package:fastfoodapp/const.dart';
import 'package:flutter/material.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40.0, left: 20.0,right:20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Xin Chào",
                      style: TextStyle(
                          color: color_background,
                          fontSize: 20,),
                    ),
                    Text(
                      "Uyển Nhi",
                      style: TextStyle(
                          color: color_background,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset('assets/images/avatar/avatar.png',
                  height: 60,width: 60,fit:BoxFit.cover,),
                )
              ],
            ),
            SizedBox(height: 20.0,),
            Divider(),
            SizedBox(height: 20.0,),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 234, 138, 131)
              ),
              child: Column(
                children: [
                  Image.asset('assets/images/avatar/avatar.png'),
                  // Text("Services",
                  // style: TextStyle(
                  //   color: color_
                  // ),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
