import 'package:flutter/material.dart';

class PaymentMethodPage extends StatelessWidget {
   final List<String> paymentMethods = [
    "Credit Card",
    "PayPal",
    "Google Pay",
    "Apple Pay",
    "Bank Transfer",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Chọn phương thức thanh toán',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          // Danh sách các phương thức thanh toán
        
          // Hiển thị danh sách phương thức thanh toán
          ListView.builder(
            shrinkWrap: true,
            itemCount: paymentMethods.length,
            itemBuilder: (BuildContext context, int index) {
              final paymentMethod = paymentMethods[index];
              return ListTile(
                title: Text(paymentMethod),
                onTap: () {
                  // Thực hiện thay đổi phương thức thanh toán khi người dùng nhấn vào
                  // Đây là nơi để xử lý logic khi người dùng chọn một phương thức thanh toán cụ thể
                  // Ví dụ: gửi yêu cầu đến máy chủ để cập nhật phương thức thanh toán
                  // và đóng bottom sheet khi hoàn thành
                  // Sau đó, bạn có thể sử dụng Navigator.pop(context) để đóng bottom sheet
                },
              );
            },
          ),
        ],
      ),
    );
  }
}