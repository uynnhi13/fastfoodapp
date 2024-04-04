import 'package:fastfoodapp/pagescustom/login.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _selectedGender = 'Nam'; // giới tính được mặc định là Nam
  String _selectedCity = 'Hồ Chí Minh'; //tỉnh thành được chọn
  DateTime _selectedDate = DateTime.now();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  final List<String> _genders = ['Nam', 'Nữ', 'Khác'];
  final List<String> _cities = [
    'Hà Nội',
    'Hồ Chí Minh',
    'Đà Nẵng',
    'Hải Phòng',
    'Cần Thơ',
    'Hải Dương',
    'Bắc Ninh',
    'Quảng Ninh',
    'Huế',
    'Quy Nhơn'
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
  backgroundColor: Color.fromARGB(255, 155, 19, 32),
  leading: Image.asset(
    'assets/images/logo.png', // Đường dẫn đến tệp ảnh logo
    width: 40, // Điều chỉnh chiều rộng của ảnh logo tùy ý
    height: 40, // Điều chỉnh chiều cao của ảnh logo tùy ý
  ),
),
  body: Padding(
    padding: const EdgeInsets.all(20),
    child: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Đăng ký tài khoản',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: "Họ và tên",
                      //icon: Icon(Icons.person),
                    ),
                  ),
                ],
              ),
              padding: EdgeInsets.all(10),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                children: [
                  TextFormField(
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      labelText: "Số điện thoại",
                      //icon: Icon(Icons.phone),
                    ),
                  ),
                ],
              ),
              padding: EdgeInsets.all(10),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                children: [
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Mật khẩu",
                      //icon: Icon(Icons.password),
                    ),
                  ),
                ],
              ),
              padding: EdgeInsets.all(10),
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    'Ngày sinh: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(width: 20.0),
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today),
                      SizedBox(width: 5.0),
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey[200]!),
                    padding:
                        MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.all(10.0)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                children: [
                  DropdownButtonFormField<String>(
                    value: _selectedGender,
                    items: _genders.map((String gender) {
                      return DropdownMenuItem<String>(
                        value: gender,
                        child: Text(gender),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        if (value != null) _selectedGender = value;
                      });
                    },
                    decoration: InputDecoration(labelText: 'Giới tính'),
                  ),
                ],
              ),
              padding: EdgeInsets.all(10),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                children: [
                  DropdownButtonFormField<String>(
                    value: _selectedCity,
                    items: _cities.map((String city) {
                      return DropdownMenuItem<String>(
                        value: city,
                        child: Text(city),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        if (value != null) _selectedCity = value;
                      });
                    },
                    decoration: InputDecoration(labelText: 'Tỉnh thành'),
                  ),
                ],
              ),
              padding: EdgeInsets.all(10),
            ),
            SizedBox(height: 20),
           ElevatedButton(
            onPressed: () {
            // Kiểm tra xem các trường thông tin đã được nhập đầy đủ hay chưa
            if (_nameController.text.isEmpty ||
                _phoneController.text.isEmpty ||
                _passwordController.text.isEmpty) {
            // Nếu còn trường thông tin nào đó chưa được nhập, hiển thị thông báo
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Hãy nhập đầy đủ thông tin!'),
              duration: Duration(seconds: 2),
            ),
      );
    } else {
      // Nếu các trường thông tin đã được nhập đầy đủ, xử lý đăng ký tài khoản
      // Hiển thị snackbar sau khi đăng ký thành công
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Đăng ký thành công!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  },
            child: Text('Đăng ký', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 155, 19, 32),
                ),
  
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Nếu đã có tài khoản, ',
                style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                ),
              ),
              TextButton(
              onPressed: () {
              // Chuyển hướng đến trang đăng nhập
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
              child: Text(
                'đăng nhập',
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
);

  }
}
