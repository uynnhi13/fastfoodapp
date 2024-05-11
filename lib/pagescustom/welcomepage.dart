import 'package:fastfoodapp/pagescustom/auth/login.dart';
import 'package:fastfoodapp/pagescustom/register.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/backgr.jpg'),
           fit: BoxFit.cover, )// Chỉnh ảnh nền sao cho phù hợp với kích thước của container
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Image.asset(
              'assets/images/logo.png', // Đường dẫn của ảnh logo
              width: 350, // Độ rộng của ảnh logo
            ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  // Chuyển đến trang đăng nhập
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: Text(
                  'Đăng nhập',
                  style: TextStyle(color: Colors.white), // Màu chữ của nút là trắng
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:Color.fromARGB(255, 155, 19, 32), // Màu nền của nút là đỏ đậm hơn
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Độ cong của góc
                  ),
                  minimumSize: Size(150, 50), // Kích thước tối thiểu của nút
  
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Chuyển đến trang đăng ký
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Register()),
                  );
                },
                child: Text(
                  'Đăng ký',
                  style: TextStyle(color: Colors.white), // Màu chữ của nút là trắng
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 155, 19, 32), // Màu nền của nút là đỏ đậm hơn
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Độ cong của góc
                  ),
                  minimumSize: Size(150, 50), // Kích thước tối thiểu của nút
  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
