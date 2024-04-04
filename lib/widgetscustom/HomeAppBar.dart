import 'package:fastfoodapp/const.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color_background,
      padding: const EdgeInsets.all(25),
      child: const Row(
        children: [
          Icon(
            Icons.sort,
            size: 30,
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
            ),
            child: Text(
              "ChuChu",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
                color: Colors.white
              ),
            ))
        ],
      ),
    );
  }
}