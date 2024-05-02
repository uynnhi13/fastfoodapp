import 'package:fastfoodapp/config/sizes.dart';
import 'package:fastfoodapp/pagescustom/orders_history/order_his_widget/order_his.dart';
import 'package:flutter/material.dart';

class OrderHisList extends StatelessWidget {
  const OrderHisList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (_, __) => SizedBox(height: TSizes.spaceBtwSections),
        itemCount: 5,
        itemBuilder: (_, index) => Column(children: [
              const OderHis(),
            ]));
  }
}
