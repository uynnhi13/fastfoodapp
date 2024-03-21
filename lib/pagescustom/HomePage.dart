import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/pagescustom/Profile.dart';
import 'package:fastfoodapp/widgetscustom/HomeAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex=0;
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex=index;
    });
  }

  _loadWidget(int index){
    var nameWidgets="Home";
    switch(index){
      case 0:
        nameWidgets="Home";
        break;
      case 1:
        nameWidgets="Menu";
      case 2:
        nameWidgets="Cart";
      case 3:{
        return const Profile();
      }
      default:
        nameWidgets="None";
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: color_background,
        title: Padding(
          padding: const EdgeInsets.all(25.0),
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
        onTap: _onItemTapped,
      ),
      body: _loadWidget(_selectedIndex),
    );
  }
}
