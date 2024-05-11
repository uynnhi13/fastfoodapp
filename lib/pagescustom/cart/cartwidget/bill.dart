import 'package:fastfoodapp/config/sizes.dart';
import 'package:fastfoodapp/config/text_them.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Billing extends StatefulWidget {
  final double tongtien;
  Billing({super.key,required this.tongtien});

  @override
  _BillingState createState() => _BillingState();
}

class _BillingState extends State<Billing> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Tổng tiền ", style: TTextTheme.whiteTextTheme.bodyLarge),
            Text(NumberFormat('#,##0').format(widget.tongtien)),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
      ],
    );
  }
}
