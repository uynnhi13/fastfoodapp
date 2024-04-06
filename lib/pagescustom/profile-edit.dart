import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/widgetscustom/ItemAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color_background,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(
          "Edit Profile",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(35),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(
                            image: AssetImage('images/avatar.png'))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: color_background,
                      ),
                      child: const Icon(
                        CupertinoIcons.camera,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                  child: Column(
                children: [
                  textFormField("Họ và tên", Icons.person),
                  const SizedBox(
                    height: 20,
                  ),
                  textFormField("Số điện thoại", Icons.phone),
                  const SizedBox(
                    height: 20,
                  ),
                  textFormField("Gmail", Icons.mail),
                  const SizedBox(
                    height: 20,
                  ),
                  textFormField("Địa chỉ", CupertinoIcons.location),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              )),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      backgroundColor: color_background,
                    ),
                    child: const Text(
                      'Lưu thông tin',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
