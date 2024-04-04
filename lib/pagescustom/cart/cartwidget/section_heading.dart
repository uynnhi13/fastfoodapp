import 'package:fastfoodapp/config/text_them.dart';
import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading( 
      {super.key,
      this.textcolor,
      this.buttonTitle = 'View all',
      this.onPressed,
      this.showActionButton = true,
      required this.title});

  final String title, buttonTitle;
  final bool showActionButton;
  final Color? textcolor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        title,
        style: TTextTheme.whiteTextTheme.headlineSmall!.apply(color: textcolor),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      if (showActionButton) TextButton(onPressed: onPressed, child: Text(buttonTitle))
    ]);
  }
}
