import 'dart:ui';

import 'package:fastfoodapp/config/sizes.dart';
import 'package:fastfoodapp/config/text_them.dart';
import 'package:fastfoodapp/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../../../config/colors.dart';

class SectionBottom extends StatelessWidget {
  const SectionBottom( 
      {super.key,
      this.color,
      this.buttonTitle = 'View all',
      this.buttonTitle2 = 'View all',
      this.onPressed,
      this.showActionButton = true,
      required this.title});

  final String title, buttonTitle, buttonTitle2;
  final bool showActionButton;
  final Color? color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, 
    children: [
      Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style:TextStyle(
          color:color,fontSize:TSizes.fontSizeMd
        )
        
      ),
      if (showActionButton) 
      ElevatedButton(onPressed: onPressed, child: Text(buttonTitle),
      style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(color_background), // Background color
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Text color
              elevation: MaterialStateProperty.all<double>(5), // Elevation
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
              ),
              
               overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return color_2; // Màu khi di chuột qua
                }
                return color_background; // Sử dụng màu mặc định
              },
            ),
                animationDuration:
                const Duration(milliseconds: 5000), // Thời gian animation

          ),
            
          ),ElevatedButton(onPressed: onPressed, child: Text(buttonTitle2,
          ),
      style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(color_1), // Background color
              foregroundColor: MaterialStateProperty.all<Color>(color_background), // Text color
              elevation: MaterialStateProperty.all<double>(5), // Elevation
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
              ),
               overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return color_7; // Màu khi di chuột qua
                }
                return color_1; // Sử dụng màu mặc định
              },
            ),
            animationDuration: const Duration(milliseconds: 5000),
              
              ))
    ]);
  }
}
