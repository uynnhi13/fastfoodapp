import 'package:fastfoodapp/config/sizes.dart';
import 'package:flutter/material.dart';



class ContainerN extends StatelessWidget {
  const ContainerN(
      {super.key,
      this.child,
      this.width,
      this.height,
      this.margin,
      this.padding,
      this.showBorder = false,
      this.radius = TSizes.cardRadiusLg,
      this.backgroundColor = Colors.white,
      this.borderColor = const Color.fromARGB(179, 199, 199, 199)});
  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color backgroundColor;
  final Color borderColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height:height,
      padding:padding,
      margin:margin,
      decoration:BoxDecoration(color:backgroundColor,
      border:showBorder?Border.all(color:borderColor):null,
      borderRadius:BorderRadius.circular(radius),
       ),
       child:child,
    );
  }
}
