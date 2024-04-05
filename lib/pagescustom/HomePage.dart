import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/pages/ProductList.dart';

import 'package:fastfoodapp/pagescustom/Home.dart';
import 'package:fastfoodapp/pagescustom/Menu.dart';
import 'package:fastfoodapp/pagescustom/Profile/Profile.dart';
import 'package:fastfoodapp/pagescustom/cart/cart.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/cart_item.dart';
import 'package:fastfoodapp/widgetscustom/CategoriesWidget.dart';

import 'package:fastfoodapp/widgetscustom/HomeAppBar.dart';
import 'package:fastfoodapp/widgetscustom/ItemsWidget.dart';
import 'package:fastfoodapp/widgetscustom/BannerWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

String _appBarTitle = 'Xin Chào, Uyển Nhi Lê!';

class _HomePageState extends State<HomePage> {
  int _selectedIndex=0;
  String _appBarTitle = 'Xin Chào, Uyển Nhi Lê!';
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex=index;
      _updateTitle(index);
    });
  }

  _loadWidget(int index) {
    var nameWidgets;
    switch (index) {
      case 0:
        return const Home();
      case 1:
        return const ProductList();
      case 2:
        return const Cart();
      case 3:
        return const Profile();
      default:
        nameWidgets="None";
    }
  }
   _updateTitle(int index){
    var nameWidgets="Home";
    switch(index){
      case 0:
        _appBarTitle="Xin chào, Uyển Nhi Lê!";
        break;
      case 1:
      _appBarTitle="List Sản Phẩm";
        return const Menu();
      case 2:
      _appBarTitle="Giỏ Hàng";
        return const Profile();
      case 3:{
        _appBarTitle="Tài Khoản";
        return const Profile();
      }
      default:
        nameWidgets = "None";
        break;
    }

   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        backgroundColor: color_background,
        title: Padding(
          padding: EdgeInsets.all(25.0),
          child: Text(
            _appBarTitle,
            style:const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
      ),

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        height: 70,
        color: color_background,
        items: const [
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            CupertinoIcons.list_bullet,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            CupertinoIcons.cart_fill,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            size: 30,
            color: Colors.white,
          ),
        ],
        onTap: _onItemTapped,
      ),
      body: _loadWidget(_selectedIndex),
    );
  }
}

// class Navigation extends GetxController {
//   final Rx<int> _selectedIndex = 0.obs;
//   final screen = [Orders(), Cart()];
// }
