import 'package:fastfoodapp/config/helper_functions.dart';
import 'package:fastfoodapp/config/sizes.dart';
import 'package:flutter/material.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon({
    required this.icon,
    super.key,
    this.width,
    this.height,
    this.size = TSizes.lg,
    this.onPressed,
    this.color,
    this.backgroundColor,
  });
  final IconData icon;
  final double? width;
  final double? height, size;
  final Color? backgroundColor;
  final Color? color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: backgroundColor != null
                  ? backgroundColor!
                  : THelperFunctions.isDarkMode(context)
                      ? Colors.black.withOpacity(0.9)
                      : Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              color: color,
              size: size,
            ),
          )),
    );
  }
}
