import 'package:fastfoodapp/config/sizes.dart';
import 'package:fastfoodapp/const.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class addNewAdr extends StatelessWidget {
  const addNewAdr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.fromLTRB(20, 80, 20, 10),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  labelText: 'Tên',
                    border: OutlineInputBorder(
                        borderRadius:
                          BorderRadius.circular(10.0)
                    ), // Thêm border vào đây
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.mobile),
                    labelText: 'Số điện thoại',
                     border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)), 
                    ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.building_31),
                          labelText: 'Tên Đường',
                           border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwInputFields),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.code), labelText: 'Số nhà',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.building_31),
                          labelText: ' Phường',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwInputFields),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.code), labelText: 'Quận',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  ),
                ],
              ),
                 const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.mobile), labelText: 'Địa chỉ',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Lưu'),
                      style: ButtonStyle(
                        maximumSize:
                            MaterialStateProperty.all<Size>(Size(200, 50)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            color_background), // Background color
                        foregroundColor: MaterialStateProperty.all<Color>(
                            color_1), // Text color
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
                              return color_5; // Màu khi di chuột qua
                            }
                            return color_background; // Sử dụng màu mặc định
                          },
                        ),
                        animationDuration: const Duration(milliseconds: 5000),
                      ))),
            ],
          )),
    ));
  }
}
