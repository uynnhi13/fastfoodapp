// import 'dart:convert';
import 'dart:convert';

import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/data/api.dart';
import 'package:fastfoodapp/model/user.dart';
import 'package:fastfoodapp/pagescustom/Profile/profile_detail.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  late TextEditingController _numberIDController = TextEditingController();
  late TextEditingController _fullNameController = TextEditingController();
  late TextEditingController _phoneNumberController = TextEditingController();
  late TextEditingController _genderController = TextEditingController();
  late TextEditingController _birthDayController = TextEditingController();
  late TextEditingController _schoolYearController = TextEditingController();
  late TextEditingController _schoolKeyController = TextEditingController();
  late TextEditingController _imageURLController = TextEditingController();

  late User user=User.userEmpty();
  late bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  getUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String strUser = pref.getString('user')!;
    user = User.fromJson(jsonDecode(strUser));

    _numberIDController = TextEditingController(text: user.idNumber);
    _fullNameController = TextEditingController(text: user.fullName);
    _phoneNumberController = TextEditingController(text: user.phoneNumber);
    _genderController = TextEditingController(text: user.gender);
    _birthDayController = TextEditingController(text: user.birthDay);
    _schoolYearController = TextEditingController(text: user.schoolYear);
    _schoolKeyController = TextEditingController(text: user.schoolKey);
    _imageURLController = TextEditingController(text: user.imageURL);
  
    // Dừng thanh loading khi dữ liệu đã được tải lên
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _numberIDController.dispose();
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _genderController.dispose();
    _birthDayController.dispose();
    _schoolYearController.dispose();
    _schoolKeyController.dispose();
    _imageURLController.dispose();
    super.dispose();
  }

  void saveUserData() async {
    user.idNumber = _numberIDController.text;
    user.fullName = _fullNameController.text;
    user.phoneNumber = _phoneNumberController.text;
    user.gender = _genderController.text;
    user.birthDay = _birthDayController.text;
    user.schoolYear = _schoolYearController.text;
    user.schoolKey = _schoolKeyController.text;
    user.imageURL = _imageURLController.text;

    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('token')!;
    await APIRepository().UpdateUser(token, user);

    await pref.setString('user', jsonEncode(user.toJson()));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: color_background,
          title: const Text("Chỉnh Sửa Thông Tin", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(user.imageURL!),
                  radius: 80,
                ),
                const SizedBox(height: 20,),
                textInput("Mã ID", _numberIDController),
                const SizedBox(height: 20,),
                textInput("Họ và Tên", _fullNameController),const SizedBox(height: 20,),
                textInput("Số điện thoại", _phoneNumberController),const SizedBox(height: 20,),
                textInput("Giới tính", _genderController),const SizedBox(height: 20,),
                textInput("Ngày sinh", _birthDayController),const SizedBox(height: 20,),
                textInput("Năm học", _schoolYearController),const SizedBox(height: 20,),
                textInput("Khóa", _schoolKeyController),const SizedBox(height: 20,),
                textInput("Link ảnh đại diện", _imageURLController),const SizedBox(height: 20,),
                SizedBox(height: 15,),
                SizedBox(
                  width: 350,
                  child: ElevatedButton(
                      onPressed: () {
                        saveUserData();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(15),
                        backgroundColor: color_background,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text(
                        'Lưu',
                        style: TextStyle(color: Colors.white,fontSize: 18),
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
