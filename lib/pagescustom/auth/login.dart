import 'package:fastfoodapp/data/api.dart';
import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/data/sharepre.dart';
import 'package:fastfoodapp/pagescustom/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _accountIDController = TextEditingController();
  final _passwordController = TextEditingController();
  login() async {
    //lấy token (lưu share_preference)
    String token = await APIRepository()
        .login(_accountIDController.text, _passwordController.text);
    var user = await APIRepository().current(token);
    // save share
    saveUser(user);
    await APIRepository().loginAdmin();
    //
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
    return token;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            color_background,
            color_len,
          ])),
          child: const Padding(
            padding: EdgeInsets.only(top: 60.0, left: 22.0),
            child: Text(
              'ChuChu Xin Chào\nĐăng Nhập!',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 200.0),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: Colors.white,
            ),
            height: double.infinity,
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png',
                  height: 150,),
                  TextField(
                    controller: _accountIDController,
                    decoration: const InputDecoration(
                        suffixIcon: Icon(
                          Icons.check,
                          color: Colors.grey,
                        ),
                        label: Text(
                          "Tài Khoản ID",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: color_background,
                          ),
                        )),
                  ),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        suffixIcon: Icon(
                          Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        label: Text(
                          "Mật Khẩu",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: color_background,
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Quên Mật Khẩu?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff281537),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [color_background, color_len],
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ElevatedButton(
                      onPressed: login,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(55),
                        backgroundColor: Colors
                            .transparent, // Đặt màu nền trong suốt cho ElevatedButton
                        elevation: 0, // Đặt độ đổ bóng là 0
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Đăng Nhập",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Không có tài khoản",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 15),
                        ),
                        Text(
                          "Đăng ký",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 17),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
