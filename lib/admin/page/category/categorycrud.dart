import 'package:fastfoodapp/admin/data/api.dart';
import 'package:fastfoodapp/admin/page/category/categoryadd.dart';
import 'package:fastfoodapp/admin/model/categorymodel.dart';
import 'package:fastfoodapp/admin/page/category/categoryedit.dart';
import 'package:fastfoodapp/const.dart';
import 'package:flutter/material.dart';

class CategoryCrud extends StatefulWidget {
  const CategoryCrud({super.key});

  @override
  State<CategoryCrud> createState() => _CategoryCrudState();
}

class _CategoryCrudState extends State<CategoryCrud> {
  List<CategoryModel> lsCategory = [];

  Future<void> getListCategory() async {
    var models = await APIRepository().getList();
    setState(() {
      lsCategory = models;
    });
  }

  Future<bool> deleteListCategory(int id) async {
    var test = await APIRepository().deleteCategory(id);
    getListCategory();
    return test;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text('Category', 24, Colors.black),
      ),
      body: Container(
        color: Color.fromARGB(16, 0, 0, 0),
        child: lsCategory.length > 0
            ? Expanded(
                // padding: const EdgeInsets.all(16),
                // alignment: Alignment.center,
                child: ListView.builder(
                    itemCount: lsCategory.length,
                    itemBuilder: (context, index) {
                      return notificationListView(context, lsCategory[index]);
                    }),
              )
            : Center(
                child: text('No category', 24, Colors.black),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Sử dụng Navigator.push để chuyển trang
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CategoryAdd()),
          );
        },
        child: Icon(Icons.add), // Biểu tượng '+' cho nút thêm
        backgroundColor: Colors.blue, // Màu sắc cho FAB
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget notificationListView(
    BuildContext context,
    CategoryModel model,
  ) {
    return Container(
      //color: Colors.white,
      margin: const EdgeInsets.only(top: 16, left: 10, right: 10),
      child: Container(
        
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    20.0), // Có thể điều chỉnh độ cong ở đây
                child: Image.network(
                  model.imageURL!, // Thay thế bằng URL ảnh của bạn
                  width: 50.0, // Định kích thước rộng của ảnh
                  height: 50.0, // Định kích thước cao của ảnh
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(
                          20.0), // Có thể điều chỉnh độ cong ở đây
                      child: const Icon(
                        Icons.image, // Icon sử dụng khi có lỗi
                        size: 50.0, // Kích thước của icon
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              width: 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text(model.name, 24, Colors.black54),
                  text(model.description!, 16, Colors.black54),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryEdit(category: model), // Đây là màn hình hiển thị list sản phẩm
                              ),
                            );
                  },
                  icon: Icon(Icons.edit),
                  iconSize: 42,
                  color: Colors.blue[300], // Icon cho nút "Edit"
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: text(
                              'Bạn có muốn xoá Category ' + model.name + ' ?',
                              16,
                              Colors.black),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Đóng popup
                              },
                              child: text('No', 16, Colors.red),
                            ),
                            TextButton(
                              onPressed: () async {
                                // Xử lý khi người dùng nhấn Yes ở đây
                                var issucces =
                                    await deleteListCategory(model.id!);

                                Navigator.of(context).pop(); // Đóng popup

                                if (issucces) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      Future.delayed(Duration(seconds: 1), () {
                                        Navigator.of(context)
                                            .pop(); // Đóng popup thành công sau 1 giây
                                      });
                                      return AlertDialog(
                                        title: Text("Success"),
                                        content: Text("Deleted successfully!"),
                                      );
                                    },
                                  );
                                }else{
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      Future.delayed(Duration(seconds: 1), () {
                                        Navigator.of(context)
                                            .pop(); // Đóng popup thành công sau 1 giây
                                      });
                                      return AlertDialog(
                                        title: Text("No Success"),
                                        content: Text("Deleted error!"),
                                      );
                                    },
                                  );
                                }
                              },
                              child: text('Yes', 16, Colors.green),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.delete), // Icon cho nút "Delete"
                  iconSize: 42,
                  color: Colors.red, // Màu của icon "Delete"
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
