import 'dart:io';
import 'package:fastfoodapp/admin/data/api.dart';
import 'package:fastfoodapp/admin/data/sharepre.dart';
import 'package:fastfoodapp/admin/model/categorymodel.dart';
import 'package:fastfoodapp/admin/model/user.dart';
import 'package:fastfoodapp/admin/page/category/categorycrud.dart';
import 'package:fastfoodapp/const.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CategoryEdit extends StatefulWidget {
  final CategoryModel category;

  const CategoryEdit({Key? key, required this.category}) : super(key: key);

  @override
  State<CategoryEdit> createState() => _CategoryEditState();
}

class _CategoryEditState extends State<CategoryEdit> {
  final TextEditingController nameCate = TextEditingController();
  final TextEditingController discCate = TextEditingController();
  final TextEditingController imgCate = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  String temp = '';

  getCategory(CategoryModel value) {
    nameCate.text = value.name;
    discCate.text = value.description!;
    imgCate.text = value.imageURL!;
  }

  Future<bool> editCategory(int id) async {
    CategoryModel value = CategoryModel(
        id: id,
        name: nameCate.text,
        imageURL: imgCate.text,
        description: discCate.text);
    var test = await APIRepository().editCategory(value);
    return test;
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
    getCategory(widget.category);
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
                          var test = await editCategory(widget.category.id!);
                          if (test) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CategoryCrud(), // Đây là màn hình hiển thị list sản phẩm
                              ),
                            );
                          } else {
                            print('Chỉnh xửa category không thành công');
                          }
                        },
                        child: const Text('Edit'),
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
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    20.0), // Có thể điều chỉnh độ cong ở đây
                child: Image.file(
                  File(imgCate.text), // Thay thế bằng URL ảnh của bạn
                  width: 250.0, // Định kích thước rộng của ảnh
                  height: 250.0, // Định kích thước cao của ảnh
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    return Image.network(
                      imgCate.text, // Thay thế bằng URL ảnh của bạn
                      width: 250.0, // Định kích thước rộng của ảnh
                      height: 250.0, // Định kích thước cao của ảnh
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(
                              20.0), // Có thể điều chỉnh độ cong ở đây
                          child: const Icon(
                            Icons.image, // Icon sử dụng khi có lỗi
                            size: 250.0, // Kích thước của icon
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
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
