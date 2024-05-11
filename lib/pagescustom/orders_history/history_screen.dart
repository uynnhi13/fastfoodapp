import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/data/api.dart';
import 'package:fastfoodapp/model/bill.dart';
import 'package:fastfoodapp/pagescustom/orders_history/history_detail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  Future<List<BillModel>> _getBills() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
    return await APIRepository().getHistory(prefs.getString('token').toString());
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color_background_2,
      child: FutureBuilder<List<BillModel>>(
        future: _getBills(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final itemBill = snapshot.data![index];
                return _billWidget(itemBill, context);
              },
            ),
          );
        },
      ),
    );
  }

  Widget _billWidget(BillModel bill, BuildContext context) {
    return InkWell(
      onTap: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var temp = await APIRepository().getHistoryDetail(bill.id, prefs.getString('token').toString());
        Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryDetail(bill: temp)));
      },
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [  
              Image.asset('assets/images/logo.png',height: 70,),
              const SizedBox(width: 40),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bill.fullName,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        color: color_background
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      NumberFormat('#,##0').format(bill.total),
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.red,
                      ),
                    ),
                    // const SizedBox(height: 4.0),
                    // Text('Category: ${pro.catId}'),
                    const SizedBox(height: 4.0),
                    Text('DateCreated: ' + bill.dateCreated),
                  ],
                ),
              ),            
            ],
          ),
        ),
      ),
    );
  }
}