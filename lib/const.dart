import 'package:flutter/material.dart';

// màu cho background nha mọi người ơi
const Color color_background = Color(0xFFC21010);
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
