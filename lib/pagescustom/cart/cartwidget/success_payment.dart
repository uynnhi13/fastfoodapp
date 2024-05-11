import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/pagescustom/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess(
      {super.key,
      required this.subTitle,
      required this.title});
  final String title, subTitle ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 140, 30, 40),
        child: Column(
          children: [
            Lottie.asset(
                'assets/images/payment_methods/Animation-1714714604754 (2).json'),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              subTitle,
              style: const TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            
             
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                ElevatedButton.icon(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder:(context) => const HomePage(),));
                      },
                      label: Text('Về trang chủ '),
                      icon: Icon(Icons.home),
                      style: ButtonStyle(
                        maximumSize: MaterialStateProperty.all<Size>(Size(200, 50)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.red), // Background color
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white), // Text color
                        elevation:
                            MaterialStateProperty.all<double>(5), // Elevation
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // Rounded corners
                          ),
                        ),
                        overlayColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.yellow; // Màu khi di chuột qua
                            }
                            return color_background; // Sử dụng màu mặc định
                          },
                        ),
                        animationDuration: const Duration(milliseconds: 5000),
                      )),
                     
                    ],
            ),
            
          ],
        ),
      ),
    ));
  }
}