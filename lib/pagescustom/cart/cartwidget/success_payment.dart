import 'package:fastfoodapp/config/helper_functions.dart';
import 'package:fastfoodapp/config/image_strings.dart';
import 'package:fastfoodapp/config/sizes.dart';
import 'package:fastfoodapp/config/text_them.dart';
import 'package:flutter/material.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess(
      {super.key,
       this.image= TImages.successfulPaymentIcon,
      required this.subTitle,
      required this.onPressed,
      required this.title});
  final String image, title, subTitle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(TSizes.appBarHeight),
        child: Column(
          children: [
            Image(
              image: AssetImage(image)

            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            Text(
              title,
              style: TTextTheme.whiteTextTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text(
              subTitle,
              style: TTextTheme.whiteTextTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: onPressed, child: const Text('Quay ve trang chu')),
            ),
            
          ],
        ),
      ),
    ));
  }
}
