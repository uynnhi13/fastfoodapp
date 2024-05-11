import 'package:fastfoodapp/config/sizes.dart';
import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/data/sqlite.dart';
import 'package:fastfoodapp/model/address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddNewAdr extends StatefulWidget {
  const AddNewAdr({Key? key}) : super(key: key);

  @override
  _AddNewAdrState createState() => _AddNewAdrState();
}

class _AddNewAdrState extends State<AddNewAdr> {
  final _addressController = TextEditingController();

  _addAddress() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await DatabaseHelper().updateAllAddressesStatus();
    Address address = Address(
      status: 1,
      addressId: 0,
      accountId: pref.getString('accountID').toString(),
      address: _addressController.text,
    );
    await DatabaseHelper().insertAddress(address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 80, 20, 10),
          child: Column(
            children: [
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.location_city),
                  labelText: 'Địa chỉ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {

                    _addAddress();
                    Navigator.pop(context);
                    setState(() {});
                  },
                  style: ButtonStyle(
                    maximumSize: MaterialStateProperty.all<Size>(Size(200, 50)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(color_background),
                    // Background color
                    foregroundColor: MaterialStateProperty.all<Color>(color_1),
                    // Text color
                    elevation:
                        MaterialStateProperty.all<double>(5), // Elevation
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Rounded corners
                      ),
                    ),
                    overlayColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return color_7; // Màu khi di chuột qua
                        }
                        return color_background; // Sử dụng màu mặc định
                      },
                    ),
                    animationDuration: const Duration(milliseconds: 5000),
                  ),
                  child: const Text('Lưu'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
