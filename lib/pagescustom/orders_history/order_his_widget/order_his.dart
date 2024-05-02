import 'package:fastfoodapp/config/colors.dart';
import 'package:fastfoodapp/config/sizes.dart';
import 'package:fastfoodapp/config/text_them.dart';
import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/cart_item.dart';
import 'package:fastfoodapp/pagescustom/orders_history/order_his_widget/section_bottom.dart';
import 'package:fastfoodapp/pagescustom/product_review/widgets/container.dart';
import 'package:flutter/material.dart';


class OderHis extends StatelessWidget {
  const OderHis({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContainerN(
            showBorder: true,
            borderColor: color_1,
            padding: const EdgeInsets.all(TSizes.md),
            backgroundColor: softGrey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Chu Chu",
                        style: TextStyle(
                            color: color_background,
                            fontSize: TSizes.fontSizeMd,
                            fontWeight: FontWeight.bold)),
                    Text("24/07/2024",
                        style: TTextTheme.whiteTextTheme.bodyMedium),
                  ],
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                const CartItem(),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                const Divider(color: color_background),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                SectionBottom(
                  title: 'Hoàn thành ',
                  buttonTitle: 'Đánh giá',
                  buttonTitle2: 'Đặt lại',
                  color: success,
                  onPressed: () {},
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
              ],
            )),
      ],
    );
  }
}
