import 'package:fastfoodapp/widgetscustom/FooterWidget.dart';

import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liên hệ'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildContactInfo(
              icon: Icons.location_on,
              text: '828 Sư Vạn Hạnh, P13, Q10, HCM',
            ),
            _buildContactInfo(
              icon: Icons.phone,
              text: '0123456789',
            ),
            _buildContactInfo(
              icon: Icons.email,
              text: 'ChuChufood@gmail.com',
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 244, 179, 201),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Liên hệ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Họ và tên',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nội dung',
                    ),
                    maxLines: 5,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Xử lý khi nhấn vào nút gửi liên hệ
                    },
                    child: Text('Gửi'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            
           
           
             
            FooterWidget()
            

          ],
          
        ),
        
      ),
      
    );
  }
  

  Widget _buildContactInfo({required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: Color.fromARGB(255, 155, 19, 32)),
          SizedBox(width: 10),
          Text(text),
        ],
      ),
    );
  }
}
