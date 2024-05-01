import 'package:fastfoodapp/actions/hidenstatusbar.dart';
import 'package:fastfoodapp/pagescustom/Profile.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/payment.dart';
import 'package:fastfoodapp/pagescustom/login.dart';
import 'package:fastfoodapp/pagescustom/register.dart';
import 'package:fastfoodapp/pagescustom/startpage.dart';
import 'package:fastfoodapp/pagescustom/welcomepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pagescustom/HomePage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await hidenstatusbar();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        "/":(context)=> StartPage(),
      },

    );
  }
}