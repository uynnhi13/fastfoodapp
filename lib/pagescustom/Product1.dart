import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/widgetscustom/ItemAppBar.dart';
import 'package:fastfoodapp/widgetscustom/NavBarProduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Product1 extends StatelessWidget {
  const Product1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: ListView(
        children: [
          // Widget ItemAppBar
          ItemAppBar("Product"),
          Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset('images/garan.jpg',height: 200,),
            ),
            //Chỉnh phần cong của Arc, nhớ cài clippy_flutter
            Arc(
              edge: Edge.TOP,
              arcType: ArcType.CONVEY,
              height: 30,
              child: Container(
                width: double.infinity,
                color: Color.fromRGBO(233, 150, 122, -50),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 50,
                        bottom: 20,
                      ),
                      child: Row(children: [
                        Text(
                          "Gà rán vui vẻ",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],),
                      ),
                      //Phần số tim của sản phẩm, cài thư viện flutter_rating_bar
                      Padding(
                        padding: EdgeInsets.only(top:2,bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemSize: 20,
                              itemPadding: EdgeInsets.symmetric(horizontal: 4),
                              itemBuilder:(context, _) => Icon(
                                Icons.favorite,
                                color: color_background,
                              ),
                              onRatingUpdate: (index){},
                            ),
                          ],
                        ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            "1 miếng gà giòn vui vẻ. Bạn sẽ thưởng thức hương vị tuyệt vời và độ giòn ngon tuyệt khi đắm chìm vào từng miếng gà chín giòn. Một trải nghiệm thú vị đang chờ đón bạn!",
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontWeight: FontWeight.normal,
                            fontSize: 13),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 70),
                          child: Row(
                            children: [
                              Text(
                                "Size",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: color_background,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10,),
                              Row(children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 8,
                                    ),
                                    ]),
                                  child: Text(
                                    "M",
                                    style: UNtextstyle(16),
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  width: 30,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 8,
                                    ),
                                    ]),
                                  child: Text(
                                    "L",
                                    style: UNtextstyle(16),
                                  ),
                                )
                              ],),
                            ],
                            ),
                        ),
                  ],),
                  ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: ItemBottomNavBarProduct(),
    );
  }
}