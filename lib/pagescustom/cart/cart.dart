import 'package:fastfoodapp/config/colors.dart';
import 'package:fastfoodapp/config/sizes.dart';
import 'package:fastfoodapp/config/text_them.dart';
import 'package:fastfoodapp/const.dart';

import 'package:fastfoodapp/pagescustom/cart/cartwidget/cart_items.dart';
import 'package:fastfoodapp/pagescustom/payment/order_cart.dart';
import 'package:fastfoodapp/pagescustom/product_review/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: const Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace), child: CartItems()),
        bottomNavigationBar: ContainerN(
            showBorder: true,
            width: 400,
            borderColor: color_1,
            padding: const EdgeInsets.all(TSizes.xl),
            backgroundColor: softGrey,
            child: Container(
              height: 100,
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tổng tiền: ",
                        style: TextStyle(
                            color: color_2,
                            fontSize: TSizes.fontSizeMd,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "200.000đ ",
                        style: TextStyle(
                            color: color_background,
                            fontSize: TSizes.fontSizeMd,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Orders()),
                            );
                          },
                          child: const Text('Mua Thêm Món'),
                          style: ButtonStyle(
                            maximumSize:
                                MaterialStateProperty.all<Size>(Size(300, 50)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                color_8), // Background color
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.black), // Text color
                            elevation: MaterialStateProperty.all<double>(
                                5), // Elevation
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Rounded corners
                              ),
                            ),
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return color_7; // Màu khi di chuột qua
                                }
                                return color_background; // Sử dụng màu mặc định
                              },
                            ),
                            animationDuration:
                                const Duration(milliseconds: 5000),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Orders()),
                            );
                          },
                          child: const Text('Thanh toán ngay '),
                          style: ButtonStyle(
                            maximumSize:
                                MaterialStateProperty.all<Size>(Size(300, 50)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                color_background), // Background color
                            foregroundColor: MaterialStateProperty.all<Color>(
                                color_1), // Text color
                            elevation: MaterialStateProperty.all<double>(
                                5), // Elevation
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Rounded corners
                              ),
                            ),
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return color_7; // Màu khi di chuột qua
                                }
                                return color_background; // Sử dụng màu mặc định
                              },
                            ),
                            animationDuration:
                                const Duration(milliseconds: 5000),
                          ))
                    ],
                  ),
                ],
              ),
            )));
  }
}
