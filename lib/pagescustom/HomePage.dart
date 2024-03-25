import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/widgetscustom/CategoriesWidget.dart';

import 'package:fastfoodapp/widgetscustom/HomeAppBar.dart';
import 'package:fastfoodapp/widgetscustom/ItemsWidget.dart';
import 'package:fastfoodapp/widgetscustom/BannerWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(children: [
        HomeAppBar(),
        Container(
          //height: 500,
          padding: EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
            color: Color(0xFFEDECF2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            )
          ),
          child: Column(children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30)
              ),
              child: Row(children: [
                Container(
                  margin: EdgeInsets.only(left: 5) ,
                  height: 50,
                  width: 300,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search here..."
                    ),
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.search,
                  size: 27,
                  color: Color.fromARGB(255, 155, 19, 32),
                )
                
              ],),
            ),

            Container(
              //alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              
            ),
             BannerWidget(),
             //categories
            Container(
              //alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              child: Text(
                'Categories',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 155, 19, 32),
                ),
              ),
            ),

            //categories Widget
            CategoriesWidget(),
          
            //item
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),

              child: Text('Best selling',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 155, 19, 32),
                  )),
            ),

            //Items Widget
            ItemsWidget(),
            
          ],),
        )
      ],),
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (index) {
          switch (index) {
            case 0:
              // Chuyển đến trang chính
              Navigator.pushReplacementNamed(context, 'cartPage');
              break;
          }
        },
        backgroundColor: Colors.transparent,
        height: 70,
        color: color_background,
        items: [
          Icon(Icons.home,size: 30, color:Colors.white,
          ),
          Icon(CupertinoIcons.list_bullet,size: 30, color:Colors.white,
          ),
          Icon(CupertinoIcons.cart_fill,size: 30, color:Colors.white,
          ),
          Icon(Icons.person,size: 30, color:Colors.white,
          ),
        ],
      ),
    );
  }
}