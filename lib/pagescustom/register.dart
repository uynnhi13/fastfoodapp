import 'package:fastfoodapp/admin/model/register.dart';
import 'package:fastfoodapp/const.dart';
import 'package:flutter/material.dart';
import 'package:fastfoodapp/config/const.dart';
import 'package:fastfoodapp/data/api.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  int _gender = 0;
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _numberIDController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _schoolKeyController = TextEditingController();
  final TextEditingController _schoolYearController = TextEditingController();
  final TextEditingController _birthDayController = TextEditingController();
  final TextEditingController _imageURL = TextEditingController();
  String gendername = 'None';
  String temp = '';

  Future<String> register() async {
    return await APIRepository().register(Signup(
        accountID: _accountController.text,
        birthDay: _birthDayController.text,
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text,
        fullName: _fullNameController.text,
        phoneNumber: _phoneNumberController.text,
        schoolKey: _schoolKeyController.text,
        schoolYear: _schoolYearController.text,
        gender: getGender(),
        imageUrl: _imageURL.text,
        numberID: _numberIDController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Đăng ký",
          style: textTitle(23),
        ),
        iconTheme: const IconThemeData(color: color_background),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                signUpWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getGender() {
    if (_gender == 1) {
      return "Male";
    } else if (_gender == 2) {
      return "Female";
    }
    return "Other";
  }

  Widget textField(
      TextEditingController controller, String label, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        obscureText: label.contains('word'),
        onChanged: (value) {
          setState(() {
            temp = value;
          });
        },
        decoration: InputDecoration(
            labelText: label,
            icon: Icon(icon),
            border: const OutlineInputBorder(),
            errorText: controller.text.trim().isEmpty ? 'Please enter' : null,
            focusedErrorBorder: controller.text.isEmpty
                ? const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red))
                : null,
            errorBorder: controller.text.isEmpty
                ? const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red))
                : null),
      ),
    );
  }

  Widget signUpWidget() {
    return Column(
      children: [
        textField(_accountController, "Account", Icons.person),
        textField(_numberIDController, "NumberID", Icons.key),
        textField(_phoneNumberController, "PhoneNumber", Icons.phone),
        textField(_birthDayController, "BirthDay", Icons.date_range),
        textField(_schoolYearController, "SchoolYear", Icons.school),
        textField(_schoolKeyController, "SchoolKey", Icons.school),
        const Text("What is your Gender?"),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: const Text("Male"),
                leading: Transform.translate(
                  offset: const Offset(16, 0),
                  child: Radio(
                    value: 1,
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: const Text("Female"),
                leading: Transform.translate(
                  offset: const Offset(16, 0),
                  child: Radio(
                    value: 2,
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: const Text("Other"),
                leading: Transform.translate(
                  offset: const Offset(16, 0),
                  child: Radio(
                    value: 3,
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        TextFormField(
          controller: _imageURL,
          decoration: const InputDecoration(
            labelText: "Image URL",
            icon: Icon(Icons.image),
          ),
        ),
        ElevatedButton(
          onPressed: register,
          child: const Text(
            "Đăng Ký",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(55),
            backgroundColor: color_background,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
