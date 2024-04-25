import 'package:fastfoodapp/config/image_strings.dart';
import 'package:fastfoodapp/config/sizes.dart';
import 'package:fastfoodapp/config/text_them.dart';
import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/paymentmethod.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/section_heading.dart';
import 'package:fastfoodapp/pagescustom/product_review/widgets/container.dart';
import 'package:flutter/material.dart';

class Payment extends StatelessWidget {
  
  const Payment({
    super.key, 
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min
      ,children: [
         SectionHeading(
          title: 'Phương thức thanh toán',
          buttonTitle: 'Thay đổi',
          onPressed: (){
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return PaymentMethodPage();});
          },
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            const ContainerN(
              width: 60,
              height: 35,
              backgroundColor: color_1,
              padding: EdgeInsets.all(TSizes.sm),
              child: Image(
                image: AssetImage(TImages.paypal),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Text("Paypal", style: TTextTheme.whiteTextTheme.bodyLarge),
          ],
        )
      ],
    );
  }
}
