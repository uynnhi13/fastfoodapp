import 'package:fastfoodapp/config/helper_functions.dart';
import 'package:fastfoodapp/config/image_strings.dart';
import 'package:fastfoodapp/config/sizes.dart';
import 'package:fastfoodapp/config/text_them.dart';
import 'package:fastfoodapp/const.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
                'assets/images/payment_methods/Animation - 1712858497296.json'),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text(
              title,
              style: const TextStyle(
                  color: color_background,
                  fontSize: TSizes.xl,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text(
              subTitle,
              style: const TextStyle(
                  color: color_2,
                  fontSize: TSizes.fontSizeLg,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            
             
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children: [
                ElevatedButton.icon(
                      onPressed: (){},
                      label: Text('Về trang chủ '),
                      icon: Icon(Icons.home),
                      style: ButtonStyle(
                        maximumSize: MaterialStateProperty.all<Size>(Size(200, 50)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            color_background), // Background color
                        foregroundColor:
                            MaterialStateProperty.all<Color>(color_1), // Text color
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
                              return color_7; // Màu khi di chuột qua
                            }
                            return color_background; // Sử dụng màu mặc định
                          },
                        ),
                        animationDuration: const Duration(milliseconds: 5000),
                      )),
                     
                    ElevatedButton.icon(
                    onPressed: (){},
                    label: Text('Xem chi tiết'),
                    icon: Icon(Icons.table_view_sharp),
                    style: ButtonStyle(
                      maximumSize:
                          MaterialStateProperty.all<Size>(Size(200, 50)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          color_background), // Background color
                      foregroundColor: MaterialStateProperty.all<Color>(
                          color_1), // Text color
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
                            return color_7; // Màu khi di chuột qua
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
