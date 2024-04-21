import 'package:fastfoodapp/config/image_strings.dart';
import 'package:fastfoodapp/config/sizes.dart';
import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/adresss.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/bill.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/cart_items.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/coupon.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/payment.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/success_payment.dart';
import 'package:fastfoodapp/pagescustom/product_review/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              CartItems(
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
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder:
                (context)=>PaymentSuccess(
                subTitle: 'vui lòng kiểm tra ví ',
                onPressed: () {},
                title: 'Thanh toán thành công ',
              )),);
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
