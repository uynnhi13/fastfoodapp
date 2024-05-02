import 'package:fastfoodapp/const.dart';
import 'package:flutter/material.dart';

class AppBarAd extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarAd({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color_background, // Thay thế bằng màu nền mong muốn
      toolbarHeight: 70,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}
