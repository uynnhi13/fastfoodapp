import 'package:fastfoodapp/config/sizes.dart';
import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/data/api.dart';
import 'package:fastfoodapp/data/sqlite.dart';
import 'package:fastfoodapp/model/address.dart';
import 'package:fastfoodapp/model/cart.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/adresss_screen.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/bill.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/cart_items.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/coupon.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/payment.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/success_payment.dart';
import 'package:fastfoodapp/pagescustom/product_review/widgets/container.dart';
import 'package:fastfoodapp/widgetscustom/ItemAppBar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  List<Cart> _productsFuture = [];
  
  late String addressString = "";
  Future<void> _getString() async {
    Address? address = await DatabaseHelper().findAddressWithStatusOne();
    // Đã nhận được địa chỉ, bạn có thể sử dụng biến address ở đây
    // Ví dụ: in địa chỉ
    if (address != null) {
      String tam = address.address.toString();

      setState(() {
        addressString = tam;
      });
    }
  }

  double total(){
    double tam = 0;
    for(int i = 0 ;i < _productsFuture.length; i++){
        tam=tam+_productsFuture[i].price*_productsFuture[i].count;
    }
    return tam;
  }

Future<void> getProducts() async {
    var tam = await DatabaseHelper().products();

    setState(() {
      _productsFuture = tam;
    });
  }

  @override
  initState() {
    super.initState();
    setState(() {
      _getString();
      getProducts();
    });
  }




  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ItemAppBar(title: "Xác nhận đơn hàng"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const CartItems(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              const Coupon(),
              const SizedBox(
                height: TSizes.defaultSpace,
              ),
              ContainerN(
                  showBorder: true,
                  padding: const EdgeInsets.all(TSizes.md),
                  backgroundColor: color_1,
                  child: Column(
                    children: [
                      AddresssScreen(address: addressString),
                      Divider(),
                      const Payment(),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      Billing(tongtien: total(),),
                    ],
                  )),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () async {
            SharedPreferences pref =await SharedPreferences.getInstance();
            List<Cart> temp =await DatabaseHelper().products();
            await APIRepository().addBill(temp, pref.getString('token').toString());
            DatabaseHelper().clear();
            setState(() {});
            Navigator.push(context, MaterialPageRoute(builder:(context) => const PaymentSuccess(subTitle: "Vui lòng kiểm tra ở phần lịch sử đơn hàng", title: "Thanh Toán Thành Công")));
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
