import 'package:fastfoodapp/const.dart';
import 'package:flutter/material.dart';

class ItemAppBar extends StatelessWidget {
  final String title;
  const ItemAppBar(this.title,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color_background,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          InkWell(
            onTap:(){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,size: 25,color: Colors.white,),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                ),
                ),
            )
        ],
      ),
      );
  }
}