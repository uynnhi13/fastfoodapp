// ignore: file_names
import 'package:fastfoodapp/const.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

// ignore: must_be_immutable
class HomeAppBar extends StatelessWidget {
  HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(25.0),
      child: const Row(
        children: <Widget>[
          Icon(
            Icons.sort,
            size: 30,
            color: color_background,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'DP Shop',
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: color_background),
            ),
          ),
          Spacer(),
          badges.Badge(
            badgeContent: Text(
              '3',
              style: TextStyle(color: color_background),
            ),
            badgeStyle: badges.BadgeStyle(
              padding: EdgeInsets.all(7),
              badgeColor: color_background,
            ),
            showBadge: true,
            ignorePointer: false,
            child: InkWell(
              //onTap: () {},
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 32,
                color: color_background,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
