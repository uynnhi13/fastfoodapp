import 'dart:io';

import 'package:fastfoodapp/admin/data/api.dart';
import 'package:fastfoodapp/admin/data/sharepre.dart';
import 'package:fastfoodapp/admin/model/user.dart';
import 'package:fastfoodapp/admin/model/categorymodel.dart';
import 'package:fastfoodapp/admin/page/category/categorycrud.dart';
import 'package:fastfoodapp/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class CategoryAdd extends StatefulWidget {
  const CategoryAdd({super.key});

  @override
  State<CategoryAdd> createState() => _CategoryAddState();
}

class _CategoryAddState extends State<CategoryAdd> {
  final TextEditingController nameCate = TextEditingController();
  final TextEditingController discCate = TextEditingController();
  final TextEditingController imgCate = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  String temp = '';

  Future<bool> addCategory() async {
    User tam = await getUser();
    CategoryModel model = CategoryModel(
        name: nameCate.text,
        description: discCate.text,
        imageURL: imgCate.text,
        accountID: tam.accountId!);
    var issucces = await APIRepository().addCategory(model);
    return issucces;
  }

  // Lấy hình ảnh từ Gallery
  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image != null) {
        setState(() {
          imgCate.text = image.path;
        });
        print("Đường dẫn hình ảnh là: " + image.path);
      }
    } catch (e) {
      print(e);
      // Khi có lỗi
    }
  }

  // Lấy hình ảnh từ Camera
  Future<void> pickImageFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        imgCate.text = image.path;
        print("Đường dẫn hình ảnh là: " + image.path);
      }
    } catch (e) {
      print(e);
      // Khi có lỗi
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Center(child: text('Add Category', 40, Colors.black)),
                const SizedBox(height: 16),
                signUpWidget(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () async {
                          var test = await addCategory();
                          if (test) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CategoryCrud(), // Đây là màn hình hiển thị list sản phẩm
                              ),
                            );
                          } else {
                            print('Thêm category không thành công');
                          }
                        },
                        child: const Text('Create'),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                  ],
                )
              ],
            )),
      ),
    );
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
        ),
      ),
    );
  }

  Widget signUpWidget() {
    return Column(
      children: [
        textField(nameCate, "name", Icons.person),
        textField(discCate, "discription", Icons.discord_outlined),
        textField(imgCate, "images", Icons.image),
        const SizedBox(height: 16),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            imageInput(imgCate.text, 250.0),
            const SizedBox(
              height: 16,
            ),
            //if (_imageFile != null) Image.file(File(_imageFile!.path)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _pickImage(ImageSource.camera),
                  icon: Icon(Icons.camera),
                  label: Text('Camera'),
                ),
                ElevatedButton.icon(
                  onPressed: () => _pickImage(ImageSource.gallery),
                  icon: Icon(Icons.photo_library),
                  label: Text('Gallery'),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ],
    );
  }
}


// Widget getUrlImg(XFile? _imageFile) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: <Widget>[
//       if (_imageFile != null) Image.file(File(_imageFile!.path)),
//       ElevatedButton.icon(
//         onPressed: () => _pickImage(ImageSource.camera),
//         icon: Icon(Icons.camera),
//         label: Text('Camera'),
//       ),
//       ElevatedButton.icon(
//         onPressed: () => _pickImage(ImageSource.gallery),
//         icon: Icon(Icons.photo_library),
//         label: Text('Gallery'),
//       ),
//     ],
//   );
// }
