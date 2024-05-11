import 'package:fastfoodapp/admin/data/api.dart';
import 'package:fastfoodapp/admin/model/product.dart';
import 'package:fastfoodapp/admin/model/productonbill.dart';
import 'package:fastfoodapp/admin/page/product/productadd.dart';
import 'package:fastfoodapp/admin/page/product/productedit.dart';
import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/data/sqlite.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  List<ProductModel> lsProduct = [];

  Future<void> getListProduct() async {
    var models = await APIRepository().getListProduct();
    setState(() {
      lsProduct = models;
    });
  }  

  Future<bool> checkProduct(int id) async{
    var lshisto = await APIRepository().getHistory();
    List<ProductOnBill> lstam = [];

    //xửa lại cho đúng trong sqlite
    var lsproduct = await DatabaseHelper().products();

    if(lsproduct.any((element) => element.productID == id)){
      return false;
    }

    for(int i = 0; i < lshisto.length ; i++){
      lstam = await APIRepository().getBillByID(lshisto[i].id!);

      if(lstam.any((element) => element.productID == id))
        return false;
    }

    return true;
  }

  Future<bool> deleteProduct(int id) async {

    var test = false;

    if(await checkProduct(id)){
      test = await APIRepository().deleteProduct(id);
    }
     
    return test;

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text('Product', 24, Colors.black),
      ),
      body: Container(
        color: Color.fromARGB(16, 0, 0, 0),
        child: lsProduct.length > 0
            ? Expanded(
                // padding: const EdgeInsets.all(16),
                // alignment: Alignment.center,
                child: ListView.builder(
                    itemCount: lsProduct.length,
                    itemBuilder: (context, index) {
                      return notificationListView(context, lsProduct[index]);
                    }),
              )
            : Center(
                child: text('No product', 24, Colors.black),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Sử dụng Navigator.push để chuyển trang
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductAdd()),
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
    ProductModel model,
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
            imageInput(model.imgURL, 50),
            Container(
              width: 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text(model.name, 24, Colors.black54),
                  text(model.desc, 16, Colors.black54),
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
                                builder: (context) => ProductEdit(product: model), // Đây là màn hình hiển thị list sản phẩm
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
                                    await deleteProduct(model.id!);

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