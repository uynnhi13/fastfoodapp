import 'package:fastfoodapp/config/device_utility.dart';
import 'package:fastfoodapp/config/text_them.dart';
import 'package:flutter/material.dart';

class TotalReviews extends StatelessWidget {
  const TotalReviews({super.key, required this.text, required this.value});
  final String text;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(text, style: TTextTheme.whiteTextTheme.bodyMedium)),
        Expanded(
          flex: 8,
          child: SizedBox(
            width: TDeviceUtils.getScreenWidth(context) * 0.8,
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey,
              value: value,
              minHeight: 11,
              borderRadius: BorderRadius.circular(7),
              valueColor: const AlwaysStoppedAnimation(Colors.blue),
            ),
          ),
        )
      ],
    );
  }
}
