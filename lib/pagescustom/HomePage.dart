import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/pagescustom/Profile.dart';
import 'package:fastfoodapp/pagescustom/address/showaddress.dart';
import 'package:fastfoodapp/pagescustom/cart/cart.dart';
import 'package:fastfoodapp/pagescustom/payment/payment_wiget/success_payment.dart';
import 'package:fastfoodapp/pagescustom/payment/order_cart.dart';
import 'package:fastfoodapp/pagescustom/orders_history/order_his.dart';
import 'package:fastfoodapp/pagescustom/orders_history/order_his_widget/order_list_his.dart';
import 'package:fastfoodapp/pagescustom/product_review/review.dart';
import 'package:fastfoodapp/widgetscustom/HomeAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _loadWidget(int index) {
    var nameWidgets;
    switch (index) {
      case 0:
        {
          return const showAdr();
        }
        nameWidgets = "Home";
        break;
      case 1:
        {
          return const ProductReview();
        }
        nameWidgets = "Menu";
      case 2:
        {
          return const Orders();
        }
        nameWidgets = "Cart";
      case 3:
        {
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
        toolbarHeight: 70,
        backgroundColor: color_background,
        title: const Padding(
          padding: EdgeInsets.all(25.0),
          child: Text(
            'ChuChu',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
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

class Navigation extends GetxController {
  final Rx<int> _selectedIndex = 0.obs;
  final screen = [Orders(), Cart()];
}
