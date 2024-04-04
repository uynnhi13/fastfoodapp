import 'package:fastfoodapp/config/sizes.dart';
import 'package:flutter/material.dart';

class ImageContainerN extends StatelessWidget {
  const ImageContainerN({
    super.key,
    this.border,
    this.padding,
    this.onPressed,
    this.width,
    this.height,
    this.applyImageRadius = true,
    required this.imgUrl,
    this.fit = BoxFit.contain,
    this.isNetworkImage = false,
    this.borderRadius = TSizes.md,
    this.backgroundColor = Colors.white,
  });

  final double? width;
  final double? height;
  final String imgUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
              border: border,
              color: backgroundColor,
              borderRadius: BorderRadius.circular(borderRadius)),
          child: ClipRRect(
              borderRadius: applyImageRadius
                  ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
              child: Image(
            fit: fit,
            image: isNetworkImage ? NetworkImage(imgUrl) : AssetImage(imgUrl)as ImageProvider,  )
          )),
    );
  }
}
  