import 'package:fastfoodapp/admin/data/api.dart';
import 'package:fastfoodapp/admin/data/sharepre.dart';
import 'package:fastfoodapp/admin/model/categorymodel.dart';
import 'package:fastfoodapp/admin/model/product.dart';
import 'package:fastfoodapp/admin/model/user.dart';
import 'package:fastfoodapp/admin/page/product/productwidget.dart';
import 'package:fastfoodapp/const.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductEdit extends StatefulWidget {
  final ProductModel product;

  const ProductEdit({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductEdit> createState() => _ProductEditState();
}

class _ProductEditState extends State<ProductEdit> {
  final TextEditingController namePro = TextEditingController();
  final TextEditingController descPro = TextEditingController();
  final TextEditingController imgPro = TextEditingController();
  final TextEditingController pricePro = TextEditingController();
  CategoryModel? selectedCategory;
  final ImagePicker _picker = ImagePicker();
  String temp = '';

  List<CategoryModel> lsCategory = [];

  setValue(ProductModel model) {
    setState(() {
      namePro.text = model.name;
      descPro.text = model.desc;
      imgPro.text = model.imgURL;
      pricePro.text = model.price.toString();

      var value = lsCategory.firstWhere((element) => element.id == model.id);
      selectedCategory = value;
    });
  }

  Future<bool> updateProduct(int id) async {
    var model = ProductModel(
        id: id,
        name: namePro.text,
        desc: descPro.text,
        imgURL: imgPro.text,
        price: int.tryParse(pricePro.text)!,
        categoryID: selectedCategory!.id!,
        categoryName: selectedCategory!.name);

    var test = await APIRepository().editProduct(model);
    return test;
  }

  Future<void> getListCategory() async {
    var models = await APIRepository().getList();
    setState(() {
      lsCategory = models;
    });
  }

  // Future<bool> addProduct() async {
  //   final int? price = int.tryParse(pricePro.text);

  //   if (selectedCategory != null && selectedCategory!.id != null && selectedCategory!.name != null && price != null) {
  //     ProductModel model = ProductModel(
  //         name: namePro.text,
  //         desc: descPro.text,
  //         imgURL: imgPro.text,
  //         price: price,
  //         categoryID: selectedCategory!.id!,
  //         categoryName: selectedCategory!.name!);
  //     var issucces = await APIRepository().addProduct(model);
  //     return issucces;
  //   }else{
  //     return false;
  //   }
  // }

  // Lấy hình ảnh từ Gallery
  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image != null) {
        setState(() {
          imgPro.text = image.path;
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
        setState(() {
          imgPro.text = image.path;
        });
        print("Đường dẫn hình ảnh là: " + image.path);
      }
    } catch (e) {
      print(e);
      // Khi có lỗi
    }
  }

  Future<void> initializeState() async {
    await getListCategory();
    await setValue(widget.product);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeState();
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
                Center(child: text('edit Product', 40, Colors.black)),
                const SizedBox(height: 16),
                signUpWidget(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () async {
                          var test = await updateProduct(widget.product.id!);
                          if (test) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductWidget(), // Đây là màn hình hiển thị list sản phẩm
                              ),
                            );
                          } else {
                            print('Thêm product không thành công');
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
        textField(namePro, "name", Icons.person),
        textField(descPro, "discription", Icons.discord_outlined),
        textField(pricePro, "price", Icons.price_change),
        textField(imgPro, "images", Icons.image),
        Row(
          children: <Widget>[
            // Icon bên trái trước Container
            Icon(
              Icons.category, // Thay thế bằng icon bạn muốn sử dụng
              color: Colors.deepPurpleAccent,
            ),
            SizedBox(width: 16), // Khoảng cách giữa icon và Dropdown
            // Sử dụng Expanded nếu bạn muốn nó chiếm hết chiều ngang còn lại
            Expanded(
              child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Colors.white,
                  buttonTheme: ButtonTheme.of(context).copyWith(
                    alignedDropdown: true,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.deepPurpleAccent,
                      width: 2,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<CategoryModel>(
                      isExpanded: true,
                      value: selectedCategory,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.deepPurple),
                      onChanged: (CategoryModel? newValue) {
                        setState(() {
                          selectedCategory = newValue;
                        });
                      },
                      items: lsCategory.map<DropdownMenuItem<CategoryModel>>(
                        (CategoryModel value) {
                          return DropdownMenuItem<CategoryModel>(
                            value: value,
                            child: Text(value.name),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            imageInput(imgPro.text, 250.0),
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
