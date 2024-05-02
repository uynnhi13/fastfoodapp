import 'package:fastfoodapp/pagescustom/ContactPage.dart';
import 'package:flutter/material.dart';

class InforPage extends StatelessWidget {
  const InforPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       //Gắn dùm cái appbar tại chưa clone bài từ nhánh mới về được
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Lịch sử hình thành:',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 155, 19, 32),
              ),
            ),
           Image.asset(
              'assets/images/logo.png', // Đường dẫn của ảnh logo
              width: 100, // Độ rộng của ảnh logo
            ),
            SizedBox(height: 10),
            Text(
              '- Nhóm trưởng: Lê Uyển Nhi ',
              style: TextStyle(fontSize: 20,
               color: Color.fromARGB(255, 155, 19, 32),
               fontWeight: FontWeight.bold,)
               ,
              
            ),
            Text(
              '- Thành viên: Đỗ Thị Kim Anh',
              style: TextStyle(fontSize: 20,
               color: Color.fromARGB(255, 155, 19, 32),
               fontWeight: FontWeight.bold,),
            ),
            Text(
              '- Thành viên: Ngô Văn Phong',
              style: TextStyle(fontSize: 20,
               color: Color.fromARGB(255, 155, 19, 32),
               fontWeight: FontWeight.bold,),
            ),
            Text(
              '- Thành viên: Nguyễn Anh Nhật',
              style: TextStyle(fontSize: 20,
               color: Color.fromARGB(255, 155, 19, 32),
               fontWeight: FontWeight.bold,),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                      context,
                        MaterialPageRoute(builder: (context) => ContactPage()),
                    );
                // Xử lý khi nhấn vào nút "Liên hệ"
              },
              child: Text('Liên hệ', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 155, 19, 32),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
