import 'package:fastfoodapp/actions/hidenstatusbar.dart';
import 'package:fastfoodapp/pagescustom/startpage.dart';
import 'package:flutter/material.dart';
import 'pagescustom/WelcomePage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await hidenstatusbar();
  runApp(const MyApp());
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
        "/":(context)=>StartPage(),
      },

    );
  }
}