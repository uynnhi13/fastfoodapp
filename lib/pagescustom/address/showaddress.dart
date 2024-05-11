import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/data/sqlite.dart';
import 'package:fastfoodapp/model/address.dart';
import 'package:fastfoodapp/pagescustom/Profile/Profile.dart';
import 'package:fastfoodapp/pagescustom/address/addnewaddress.dart';
import 'package:fastfoodapp/pagescustom/address/addresswidget/singleaddress.dart';
import 'package:fastfoodapp/pagescustom/cart/order_cart.dart';
import 'package:fastfoodapp/widgetscustom/ItemAppBar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class showAdr extends StatefulWidget {
  const showAdr({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _showAdrState createState() => _showAdrState();
}

// ignore: camel_case_types
class _showAdrState extends State<showAdr> {
  Future<List<Address>> getListAdress() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final String accountID = pref.getString('accountID') ??
        ''; // Sử dụng ?? để xử lý trường hợp pref.getString('accountID') là null

    return await DatabaseHelper().getAddresses(accountID);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future<List<Address>> lstAdrress = getListAdress();
  }

  Widget _buildAddressList(List<Address> addresses) {
    if (addresses.isEmpty) {
      return const Center(
        child: Text(
          'Danh sách địa chỉ trống',
          style: TextStyle(fontSize: 18),
        ),
      );
    } else {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: addresses.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) async {
                bool check=await DatabaseHelper().checkAddressStatus(addresses[index].addressId);
                if(check){
                  
                }
                // Xóa địa chỉ khi người dùng kéo qua
                DatabaseHelper().deleteAddress(addresses[index].addressId);
                setState(() {
                  addresses.removeAt(index);
                });
              },
              background: Container(
                color: Colors.red[400],
                padding: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerRight,
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              child: InkWell(
                onTap: () async {
                  await DatabaseHelper().updateAllAddressesStatus();
                  await DatabaseHelper()
                      .updateAddressStatus(addresses[index].addressId);
                  print(addresses[index].status.toString());
                  setState(() {});
                },
                child: SingleAddress(
                  selectedAddress: addresses[index].status,
                  address: addresses[index],
                ),
              ),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: color_background,
      toolbarHeight: 70,
      leading: IconButton(
        onPressed: () { 
          Navigator.push(context, MaterialPageRoute(builder:(context) => Orders(),));
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      title: Text(
        "Địa chỉ",
        style: TextStyle(color: Colors.white, fontSize: 18),
      )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        child: FutureBuilder<List<Address>>(
          future: getListAdress(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Bạn chưa thêm địa chỉ'),
              );
            } else {
              return _buildAddressList(snapshot.data ?? []);
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddNewAdr(),
              )).then((value) {
            setState(() {});
          });
        },
        backgroundColor: color_1,
        child: const Icon(Iconsax.add, color: color_2),
      ),
    );
  }
}
