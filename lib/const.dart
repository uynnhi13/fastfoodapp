import 'package:flutter/material.dart';

// màu cho background nha mọi người ơi
const Color color_1 = Color.fromARGB(222, 255, 255, 255);
const Color color_2 = Color.fromARGB(255, 46, 46, 46);
const Color color_3 = Color.fromARGB(255, 255, 255, 255);
const Color color_4 = Color.fromARGB(255, 149, 45, 55);
const Color color_5 = Color.fromARGB(255, 198, 198, 198);
const Color primarys = Color(0xFFCFD5F3);

const Color color_background = Color(0xFFC21010);
const Color background = Color.fromARGB(255, 237, 237, 237);
TextStyle UNtextstyle(double size) {
  return TextStyle(
    color: color_background,
    fontWeight: FontWeight.bold,
    fontSize: size,
  );
}

Text text(String value, double size, Color colorText) {
  return Text(
    value,
    style: TextStyle(
      fontSize: size,
      color: colorText,
      fontWeight: FontWeight.bold,
    ),
  );
}

//Khung nhập dữ liệu input
TextFormField textFormField(String label, IconData icon) {
  return TextFormField(
    decoration: InputDecoration(
        label: Text(label),
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        floatingLabelStyle: const TextStyle(
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
