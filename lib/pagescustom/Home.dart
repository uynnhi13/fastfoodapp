import 'package:fastfoodapp/widgetscustom/BannerWidget.dart';
import 'package:fastfoodapp/widgetscustom/CategoriesWidget.dart';
import 'package:fastfoodapp/widgetscustom/HomeAppBar.dart';
import 'package:fastfoodapp/widgetscustom/ItemsWidget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:ListView(children: [
        Container(
          //height: 500,
          padding: EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
            color: Color(0xFFEDECF2),
            
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

    );
  }
}