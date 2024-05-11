import 'dart:convert';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fastfoodapp/admin/page/History/histotywidget.dart';
import 'package:fastfoodapp/admin/page/category/categorycrud.dart';
import 'package:fastfoodapp/admin/page/product/productwidget.dart';
import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/data/sharepre.dart';
import 'package:fastfoodapp/model/user.dart';
import 'package:fastfoodapp/pagescustom/Home.dart';
import 'package:fastfoodapp/pagescustom/Menu.dart';
import 'package:fastfoodapp/pagescustom/Profile/Profile.dart';
import 'package:fastfoodapp/pagescustom/cart/cart.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/cart_item.dart';
import 'package:fastfoodapp/pagescustom/cart/order_cart.dart';
import 'package:fastfoodapp/pagescustom/orders_history/history_screen.dart';
import 'package:fastfoodapp/widgetscustom/CategoriesWidget.dart';
import 'package:fastfoodapp/widgetscustom/HomeAppBar.dart';
import 'package:fastfoodapp/pagescustom/product/ItemsWidget.dart';
import 'package:fastfoodapp/widgetscustom/BannerWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fastfoodapp/admin/model/user.dart' as userd;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

String _appBarTitle = 'Xin Chào, Uyển Nhi Lê!';

class _HomePageState extends State<HomePage> {

  User user = User.userEmpty();
  bool check=true;

  checkadmin(){
    //API.accountID 
  }

  getDataUser() async{
    SharedPreferences pref= await SharedPreferences.getInstance();
    String strUser=pref.getString('user')!;

    user=User.fromJson(jsonDecode(strUser));
    setState(() {
    });
  }

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
        {
          return const HistoryScreen();
        }
      case 2:
        return const CartScreen();
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
      _appBarTitle="Lịch sử mua hàng";
      case 2:
      _appBarTitle="Giỏ Hàng";
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
        automaticallyImplyLeading: check,
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
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 243, 152, 33),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    imageInput(userd.User.model.imageURL!, 100),
                    const SizedBox(height: 8,),
                    text(userd.User.model.fullName!, 16, Colors.black),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Category'),
              onTap:(){
                Navigator.pop(context);
                _selectedIndex=0;
                setState(() {});
                Navigator.push(context, 
                  MaterialPageRoute(builder: (context)=> const CategoryCrud()));
              }
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Product'),
              onTap:(){
                Navigator.pop(context);
                _selectedIndex=1;
                setState(() {});
                Navigator.push(context, 
                  MaterialPageRoute(builder: (context)=> const ProductWidget()));
              }
            ),
            ListTile(
              leading: const Icon(Icons.pages),
              title: const Text("Bill"),
              onTap: () {
                Navigator.pop(context);
                _selectedIndex=2;
                Navigator.push(context, 
                  MaterialPageRoute(builder: (context)=> const HistoryWidget()));
              },
            ),

            // ListTile(
            //   leading: const Icon(Icons.contact_mail),
            //   title: const Text("History"),
            //   onTap: () {
            //     Navigator.pop(context);
            //     _selectedIndex=1;
            //     setState(() {
            //     });
            //   },
            // ),
            // ListTile(
            //   leading: const Icon(Icons.badge),
            //   title: const Text("Cart"),
            //   onTap: () {
            //     Navigator.pop(context);
            //     _selectedIndex=2;
            //     setState(() {
            //     });
            //   },
            // ),
            // ListTile(
            //   leading: const Icon(Icons.pages),
            //   title: const Text("Category List For Admin"),
            //   onTap: () {
            //     Navigator.pop(context);
            //     _selectedIndex=0;
            //     Navigator.push(context, 
            //       MaterialPageRoute(builder: (context)=> const Home()));
            //   },
            // ),
            // ListTile(
            //   leading: const Icon(Icons.pages),
            //   title: const Text("Product List For Admin"),
            //   onTap: () {
            //     Navigator.pop(context);
            //     _selectedIndex=0;
            //     Navigator.push(context, 
            //       MaterialPageRoute(builder: (context)=>const Home()));
            //   },
            // ),
            // ListTile(
            //   leading: const Icon(Icons.pages),
            //   title: const Text("Page 3"),
            //   onTap: () {
            //     Navigator.pop(context);
            //     _selectedIndex=0;
            //     Navigator.push(context, 
            //       MaterialPageRoute(builder: (context)=>const Home()));
            //   },
            // ),
            const Divider(
              color: Colors.black,
            ),
            user.accountId==''
              ?const SizedBox()
              :ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text("Logout"),
                onTap: () {
                  logOut(context);
                },
              )
          ],
        ),
      ),

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: color_background_2,
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
