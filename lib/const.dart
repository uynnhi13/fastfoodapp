import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// màu cho background nha mọi người ơi
const Color color_1 = Color.fromARGB(222, 255, 255, 255);
const Color color_2 = Color.fromARGB(255, 46, 46, 46);
const Color color_3 = Color.fromARGB(255, 255, 255, 255);
const Color color_4 =Color.fromARGB(255, 149, 45, 55);
const Color color_5 = Color.fromARGB(255, 198, 198, 198);
const Color primarys = Color(0xFFCFD5F3);

const Color color_6 = Color.fromARGB(255, 252, 255, 158);
const Color color_7 = Color.fromARGB(255, 130, 130, 130);
const Color color_8 = Color.fromARGB(255, 248, 255, 40);//màu phối với background đỏ ở phần login

const Color color_background = Color(0xFFC21010);
const Color color_len=Color(0xff281537); 
const Color color_background_2=Color(0xFFEDECF2);
TextStyle UNtextstyle(double size) {
  return TextStyle(
    color: color_background,
    fontWeight: FontWeight.bold,
    fontSize: size,
  );
}

//Khung nhập dữ liệu input
  TextFormField textFormField(String label, IconData icon) {
    return TextFormField(
      decoration: InputDecoration(
          label: Text(label),
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          floatingLabelStyle: TextStyle(
            color: color_background,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: color_background,
            ),
            borderRadius: BorderRadius.circular(15),
          )),
    );
  }

//Khung nhập dữ liệu input
  TextFormField textInput(String label, TextEditingController Tcontroller) {
    return TextFormField(
      controller: Tcontroller,
      decoration: InputDecoration(
          label: Text(label),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          floatingLabelStyle: TextStyle(
            color: color_background,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: color_background,
            ),
            borderRadius: BorderRadius.circular(15),
          )),
    );
  }


Text text(String value, double size, Color colorText) {
  return Text(
    value,
    style: TextStyle(
      fontSize: size,
      color: colorText,
      fontWeight: FontWeight.bold,
      fontFamily: 'Arial'
    ),
    maxLines: 1,
    overflow: TextOverflow.ellipsis
  );
}


Widget imageInput(String imgPath, double sizeImg) {
  return Container(
    margin: const EdgeInsets.only(top: 16, bottom:  16, ),
    child: ClipRRect(
      borderRadius:
          BorderRadius.circular(20.0), // Có thể điều chỉnh độ cong ở đây
      child: Image.file(
        File(imgPath), // Thay thế bằng URL ảnh của bạn
        width: sizeImg, // Định kích thước rộng của ảnh
        height: sizeImg, // Định kích thước cao của ảnh
        fit: BoxFit.cover,
        errorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) {
          return Image.network(
            imgPath, // Thay thế bằng URL ảnh của bạn
            width: sizeImg, // Định kích thước rộng của ảnh
            height: sizeImg, // Định kích thước cao của ảnh
            fit: BoxFit.cover,
            errorBuilder:
                (BuildContext context, Object error, StackTrace? stackTrace) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(
                    20.0), // Có thể điều chỉnh độ cong ở đây
                child: Icon(
                  Icons.image, // Icon sử dụng khi có lỗi
                  size: sizeImg, // Kích thước của icon
                ),
              );
            },
          );
        },
      ),
    ),
  );
}

String formatCurrency(int? amount) {
  final formatter = NumberFormat.currency(locale: 'vi_VN', symbol: '₫');
  return formatter.format(amount);
}

TextStyle textTitle(double size) {
  return TextStyle(
    fontWeight: FontWeight.bold,
    color: color_background,
    fontSize: size,
  );
}


