import 'package:fastfoodapp/actions/hidenstatusbar.dart';
import 'package:fastfoodapp/pagescustom/Profile.dart';


import 'package:fastfoodapp/pagescustom/ContactPage.dart';
import 'package:fastfoodapp/pagescustom/InforPage.dart';
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
        "/":(context)=>HomePage(),
      },

    );
  }
}