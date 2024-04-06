import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/pagescustom/HomePage.dart';
import 'package:fastfoodapp/pagescustom/register.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 155, 19, 32),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        width: 200,
                        height: 150,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'Đăng nhập',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      //SizedBox(height: 10),
                      // Thêm logo dưới tiêu đề
                      
                    ],
                  ),
                  SizedBox(height: 20),
                  Form(
                    child: Column(
                      children: [
                        textFormField("Số điện thoại", Icons.phone),
                        const SizedBox(
                          height: 20,
                        ),
                        textFormField("Mật khẩu", Icons.password),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                      // Xử lý đăng nhập ở đây
                      // Hiển thị snackbar sau khi đăng nhập thành công
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Đăng nhập thành công!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    child: Text('Đăng nhập', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 155, 19, 32),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Nếu chưa có tài khoản, ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Chuyển hướng đến trang đăng ký
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        },
                        child: Text(
                          'đăng ký',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
