import 'package:fastfoodapp/admin/data/api.dart';
import 'package:fastfoodapp/admin/model/history.dart';
import 'package:fastfoodapp/admin/model/productonbill.dart';
import 'package:fastfoodapp/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BillDetail extends StatefulWidget {
  final HistoryModel historyModel;

  const BillDetail({Key? key, required this.historyModel}) : super(key: key);

  @override
  State<BillDetail> createState() => _BillDetailState();
}

class _BillDetailState extends State<BillDetail> {
  List<ProductOnBill> lsProductOnBill = [];
  HistoryModel historyModel = HistoryModel();

  bool isloading = true;
  Future<void> getBillByID(String id) async {
    var models = await APIRepository().getBillByID(id);

    setState(() {
      lsProductOnBill = models;

      isloading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBillByID(widget.historyModel.id!);
    historyModel = widget.historyModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text(
          'Đơn #' + historyModel.id.toString(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      )),
      body: isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              color: Colors.black12,
              child: Center(
                child: Column(
                  children: [
                    inforUser(historyModel),
                    Container(
                      child: lsProductOnBill.length > 0
                          ? Expanded(
                              // padding: const EdgeInsets.all(16),
                              // alignment: Alignment.center,
                              child: ListView.builder(
                                  itemCount: lsProductOnBill.length,
                                  itemBuilder: (context, index) {
                                    if (index != (lsProductOnBill.length - 1)) {
                                      return Column(
                                        children: [
                                          itemProduct(
                                          context, lsProductOnBill[index]),
                                          const SizedBox(height: 16,),
                                          const Divider(),
                                        ],
                                      );
                                    } else {
                                      return itemProduct(
                                          context, lsProductOnBill[index]);
                                    }
                                  }),
                            )
                          : Center(
                              child: text('No product', 24, Colors.black),
                            ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  // Widget listProduct(List<ProductOnBill> models) {
  //   return ListView.builder(
  //       itemCount: models.length,
  //       itemBuilder: (context, index) {
  //         return itemProduct(context , models[index]);
  //       });
  // }

  Widget itemProduct(BuildContext context, ProductOnBill model) {
    return Container(
      margin: const EdgeInsets.only(left: 26, right: 26, top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          imageInput(model.imageURL, 50),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text(model.productName, 24, Colors.black54),
                text('SL: ' + model.count.toString(), 16, Colors.black54),
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                text('Tổng', 24, Colors.black54),
                text(formatCurrency(model.total), 16, Colors.black54),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget inforUser(HistoryModel model) {
    return Container(
      margin: const EdgeInsets.only(
        left: 25,
        right: 25,
        top: 12,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          justifycontent(text('Mã đơn hàng: ', 14, color_5), SizedBox(),
              const EdgeInsets.all(0)),
          justifycontent(Expanded(child: text('#' + model.id!, 14, color_5)),
              SizedBox(), const EdgeInsets.all(0)),
          const SizedBox(
            height: 16,
          ),
          const Divider(),
          justifycontent(text(model.fullName!, 26, color_2), SizedBox(),
              const EdgeInsets.only(top: 16)),
          justifycontent(text(model.dateCreated!, 20, color_5), SizedBox(),
              const EdgeInsets.only()),
          justifycontent(
              text('Tổng tiền: ', 26, color_2),
              Expanded(
                  child: text(
                      formatCurrency(model.total), 26, Colors.red.shade400)),
              const EdgeInsets.only(top: 16)),
        ],
      ),
    );
  }

  Widget justifycontent(Widget a, Widget b, EdgeInsets value) {
    return Container(
      margin: value,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [a, b],
      ),
    );
  }

  Widget IconAfterText(Icon ic, Text text, EdgeInsets value) {
    return Container(
      margin: value,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ic,
          SizedBox(
            width: 10,
          ),
          Expanded(child: text)
        ],
      ),
    );
  }
}
