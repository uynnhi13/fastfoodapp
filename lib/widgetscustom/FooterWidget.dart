import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png', // Đường dẫn đến tệp ảnh logo
                width: 50, // Điều chỉnh chiều rộng của ảnh logo tùy ý
                height: 50, // Điều chỉnh chiều cao của ảnh logo tùy ý
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '828 Sư Vạn Hạnh, P13, Q10, HCM',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Điện thoại: 0123456789',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Hộp thư góp ý: ChuChufood@gmail.com',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  // Xử lý khi nhấn vào icon Gmail
                },
                icon: Icon(
                  Icons.mail,
                  color: Color.fromARGB(255, 155, 19, 32),
                ),
              ),
              SizedBox(width: 30),
              IconButton(
                onPressed: () {
                  // Xử lý khi nhấn vào icon Facebook
                },
                icon: Icon(
                  Icons.facebook,
                  color: Color.fromARGB(255, 155, 19, 32),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
