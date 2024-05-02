import 'package:fastfoodapp/config/image_strings.dart';
import 'package:fastfoodapp/config/sizes.dart';
import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/pagescustom/payment/payment_wiget/adresss.dart';
import 'package:fastfoodapp/pagescustom/payment/payment_wiget/bill.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/cart_items.dart';
import 'package:fastfoodapp/pagescustom/payment/payment_wiget/cart_items_o.dart';
import 'package:fastfoodapp/pagescustom/payment/payment_wiget/coupon.dart';
import 'package:fastfoodapp/pagescustom/payment/payment_wiget/payment.dart';
import 'package:fastfoodapp/pagescustom/payment/payment_wiget/success_payment.dart';
import 'package:fastfoodapp/pagescustom/product_review/review.dart';
import 'package:fastfoodapp/pagescustom/product_review/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Orders extends StatelessWidget {
  const Orders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              CartItemsO(
                showAddRemoveButtons: false,
              ),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Coupon(),
              SizedBox(
                height: TSizes.defaultSpace,
              ),
              ContainerN(
                  showBorder: true,
                  padding: EdgeInsets.all(TSizes.md),
                  backgroundColor: color_1,
                  child: Column(
                    children: [
                      Addresss(),
                      Divider(),
                      Payment(),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      Divider(),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      Billing(),
                    ],
                  )),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const PaymentSuccess(
                        title: 'Thanh toán thành công ',
                        subTitle: 'Vui lòng kiểm tra ví ',
                      )),
            );
          },
          style: ElevatedButton.styleFrom(backgroundColor: color_background),
          child: const Text(
            'Thanh toán',
            style: TextStyle(color: color_1),
          ),
        ),
      ),
    );
  }
}
