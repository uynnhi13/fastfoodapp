import 'package:fastfoodapp/config/sizes.dart';
import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/pagescustom/address/addnewaddress.dart';
import 'package:fastfoodapp/pagescustom/address/addresswidget/singleaddress.dart';
import 'package:fastfoodapp/pagescustom/product_review/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

class showAdr extends StatelessWidget {
  const showAdr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => addNewAdr()),
            );
          },
          backgroundColor: color_1,
          child: const Icon(Iconsax.add, color: color_2),
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20, 50, 20, 10),
          child: Column(
            children: [
              SingleAddress(
                selectedAddress: false,
              ),
              SingleAddress(
                selectedAddress: true,
              ),
                SingleAddress(
                selectedAddress: false,
              ),
                SingleAddress(
                selectedAddress: false,
              ),
              SingleAddress(
                selectedAddress: false,
              ),
            ],
          ),
        ));
  }
}
