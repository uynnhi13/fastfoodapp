import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 1; i < 5; i++)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 155, 19, 32),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/foods/Category/$i.png",
                    width: 40,
                    height: 40,
                  ),
                  // Để hiển thị tên sản phẩm, bạn có thể thêm Text widget ở đây
                  //Text('Gà rán',
                  //style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  //fontSize: 16,
                  //color: Color.fromARGB(255, 155, 19, 32),
                //),
              //)
                ],
              ),
            )
        ],
      ),
    );
  }
}
