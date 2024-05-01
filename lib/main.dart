import 'package:fastfoodapp/actions/hidenstatusbar.dart';
import 'package:fastfoodapp/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pagescustom/WelcomePage.dart';
import 'pagescustom/login.dart';


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
        "/":(context)=>MyHomePage(),
      },

    );
  }
}