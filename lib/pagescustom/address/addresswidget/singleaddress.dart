import 'dart:convert';

import 'package:fastfoodapp/config/sizes.dart';
import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/data/sqlite.dart';
import 'package:fastfoodapp/model/address.dart';
import 'package:fastfoodapp/model/user.dart';
import 'package:fastfoodapp/pagescustom/product_review/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SingleAddress extends StatefulWidget {
  const SingleAddress(
      {super.key, required this.selectedAddress, required this.address});

  final int selectedAddress;
  final Address address;

  @override
  // ignore: library_private_types_in_public_api
  _SingleAddressState createState() => _SingleAddressState();
}

class _SingleAddressState extends State<SingleAddress> {
  User user = User.userEmpty();
  getDataUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String strUser = pref.getString('user')!;

    user = User.fromJson(jsonDecode(strUser));
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getDataUser();
  }

  @override
  Widget build(BuildContext context) {
    return ContainerN(
        padding: const EdgeInsets.all(TSizes.md),
        width: double.infinity,
        showBorder: true,
        backgroundColor: widget.selectedAddress==1
            ? color_background.withOpacity(0.4)
            : Colors.transparent,
        borderColor: primarys,
        margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        child: Stack(
          children: [
            Positioned(
              right: 5,
              top: 0,
              child: Icon(widget.selectedAddress==1 ? Iconsax.tick_circle5 : null,
                  color: color_background),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.fullName!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: color_background,
                      fontSize: TSizes.md,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: TSizes.sm / 2),
                Text(
                  user.phoneNumber.toString(),
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: TSizes.sm / 2),
                Text(
                  widget.address.addressId.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
                Text(
                  widget.address.address,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              ],
            ),
          ],
        ),
      );
  }
}
