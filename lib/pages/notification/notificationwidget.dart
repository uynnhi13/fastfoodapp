import 'package:fastfoodapp/config/sizes.dart';
import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/model/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({super.key});

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  // ignore: non_constant_identifier_names
  List<Noti> lsNotifica = [];

  void getListNotifi(){
    lsNotifica.add(Noti( id: 1,nameNotifica:  'Thong bao 1',description:  'dấdfasdfasdfasdfasdfasdfasdf',dateTime: DateTime.parse('2002-05-26'),imgUrl:  'images.png'));
    lsNotifica.add(Noti( id: 1,nameNotifica:  'Thong bao 1',description:  'dấdfasdfasdfasdfasdfasdfasdf',dateTime: DateTime.parse('2002-05-26'),imgUrl:  'images.png'));
    lsNotifica.add(Noti( id: 1,nameNotifica:  'Thong bao 1',description:  'dấdfasdfasdfasdfasdfasdfasdf',dateTime: DateTime.parse('2002-05-26'),imgUrl:  'images.png'));
    lsNotifica.add(Noti( id: 1,nameNotifica:  'Thong bao 1',description:  'dấdfasdfasdfasdfasdfasdfasdf',dateTime: DateTime.parse('2002-05-26'),imgUrl:  'images.png'));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListNotifi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text('Thông báo', 24, Colors.black),
      ),
      body: Container(
        color: Colors.black12,
        child: lsNotifica.length > 0 ?
        Expanded(
            // padding: const EdgeInsets.all(16),
            // alignment: Alignment.center,
            child: ListView.builder(
                itemCount: lsNotifica.length,
                itemBuilder: (context, index) {
                  
                  return notificationListView(
                      context, lsNotifica[index]);
                }),
          ):
          Center(
            child: text('No notifications', TSizes.fontSizeMd, Colors.black),
          ),
      ),
    );
  }
}

Widget notificationListView(
  BuildContext context,
  Noti model,
) {
  return Container(
        //color: Colors.white,
        margin: const EdgeInsets.only(top: 16,left: 10, right: 10),
        child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: Colors.white
            ),
            child: Row(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        20.0), // Có thể điều chỉnh độ cong ở đây
                    child: Image.network(
                      model.imgUrl!, // Thay thế bằng URL ảnh của bạn
                      width: 50.0, // Định kích thước rộng của ảnh
                      height: 50.0, // Định kích thước cao của ảnh
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(
                              20.0), // Có thể điều chỉnh độ cong ở đây
                          child:const Icon(
                            Icons.image, // Icon sử dụng khi có lỗi
                            size: 50.0, // Kích thước của icon
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text(model.nameNotifica??'', TSizes.fontSizeMd, Colors.black87),
                      text(model.description??'', TSizes.fontSizeMd, Colors.black54),
                      text(
                        DateFormat('yyyy/MM/dd HH:mm').format(model.dateTime!)
                        , TSizes.fontSizeSm
                        , Colors.black45
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
      );
}
