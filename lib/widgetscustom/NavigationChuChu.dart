import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fastfoodapp/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (index) {
          switch (index) {
            case 0:
              // Chuyển đến trang chính
              Navigator.pushReplacementNamed(context, '/');
              break;
            case 2:
              // Chuyển đến trang chính
              Navigator.pushReplacementNamed(context, '/cartPage');
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/profile');
          }
        },
        backgroundColor: Colors.transparent,
        height: 70,
        color: color_background,
        items: const [
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