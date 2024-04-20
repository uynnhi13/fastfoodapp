import 'package:fastfoodapp/config/colors.dart';
import 'package:fastfoodapp/config/sizes.dart';
import 'package:fastfoodapp/config/text_them.dart';
import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/cart_item.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/section_heading.dart';
import 'package:fastfoodapp/pagescustom/orders_history/order_his_widget/order_his.dart';
import 'package:fastfoodapp/pagescustom/orders_history/order_his_widget/order_list_his.dart';
import 'package:fastfoodapp/pagescustom/orders_history/order_his_widget/section_bottom.dart';
import 'package:fastfoodapp/pagescustom/product_review/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

class OrderListItemHis extends StatelessWidget {
  const OrderListItemHis({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 40, 10, 40),
        child: OrderHisList(),
      ),
    );
  }
}
