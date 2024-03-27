import 'package:fastfoodapp/pagescustom/Product1.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Product1()));
          }, 
          child: Text('Go to Product1')
          ),
      ),
    );
  }
}