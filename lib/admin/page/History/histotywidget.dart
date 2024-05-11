import 'package:fastfoodapp/admin/data/api.dart';
import 'package:fastfoodapp/admin/model/history.dart';
import 'package:fastfoodapp/admin/page/History/billdetail.dart';
import 'package:fastfoodapp/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fastfoodapp/const.dart';

class HistoryWidget extends StatefulWidget {
  const HistoryWidget({super.key});

  @override
  State<HistoryWidget> createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  List<HistoryModel> lsHistory = [];
  List<HistoryModel> allHistory = [];

  bool isLoading = true;
  DateTime today = DateTime.now();

  //time
  DateTime _selectedDay = DateTime.now();
  DateTime? _selectedDay1;
  DateTime? _selectedDay2;

  void _onDaySelected(DateTime day, DateTime focusday) {
    setState(() {
      today = day;
    });
  }

  void filterRevenueByDate() {
    // Lọc lsHistory hoặc revenueList của bạn dựa trên _selectedDay
    // Ví dụ đơn giản, giả định bạn có một list `lsHistory` chứa doanh thu cùng với ngày
    if (_selectedDay1 != null && _selectedDay2 != null) {
      DateTime select1;
      DateTime select2;

      if (_selectedDay1!.isBefore(_selectedDay2!)) {
        select1 = _selectedDay1!;
        select2 = _selectedDay2!;
      } else {
        select1 = _selectedDay2!;
        select2 = _selectedDay1!;
      }

      List<HistoryModel> tam = [];

      for (int i = 0; i < allHistory.length; i++) {
        if (convertStringtoTime(allHistory[i].dateCreated!).isBefore(select2) &&
            convertStringtoTime(allHistory[i].dateCreated!).isAfter(select1)) {
          tam.add(allHistory[i]);
        }
      }

      // Cập nhật giao diện dựa trên doanh thu đã lọc
      setState(() {
        lsHistory = tam;
      });
    }else{
      setState(() {
        lsHistory = allHistory;
      });
    }
  }

  DateTime convertStringtoTime(String date) {
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    DateTime dateTime = dateFormat.parse(date.trim());
    return dateTime;
  }

  Future<void> getHistory() async {
    var tam = await APIRepository().getHistory();
    setState(() {
      allHistory = tam;
      lsHistory = tam;
      isLoading = false;
    });
  }

  int sumRevenue() {
    return lsHistory.fold(
        0, (previousValue, element) => previousValue + element.total!);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Title(color: Colors.black,
         child: text('Hóa đơn',20, Colors.black),),
      ),
      body: isLoading
        ? Center(
            child:
                CircularProgressIndicator(), // Hiển thị tiêu đề chờ nếu đang tải dữ liệu
          )
        : Container(
            color: Color.fromARGB(16, 0, 0, 0),
            child: allHistory.isNotEmpty
                ? Column(
                    children: [
                      caculator(),
                      Container(
                        margin:
                            const EdgeInsets.only(top: 20, left: 16, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            text('Tổng tiền: ', 20, Colors.black),
                            text(formatCurrency(sumRevenue()), 20, Colors.red)
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: lsHistory.length,
                          itemBuilder: (context, index) {
                            return notificationListView(
                                context, lsHistory[index]);
                          },
                        ),
                      )
                    ],
                  )
                : Center(
                    child: Text('No history'),
                  ),
          ),
    );
  }

  Widget caculator() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: TableCalendar(
            rowHeight: 42,
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            availableGestures: AvailableGestures.all,
            firstDay: DateTime.utc(2022, 1, 1),
            lastDay: DateTime.now(),
            focusedDay: today,
            pageAnimationCurve: Curves.linear,
            //selectedDayPredicate: (day)=> isSameDay(day, today),
            selectedDayPredicate: (day) {
              if (_selectedDay1 != null && _selectedDay2 != null) {
                // Nếu ngày đó nằm trong khoảng từ _selectedDay1 đến _selectedDay2 (bao gồm cả hai ngày này), hãy hiển thị như là ngày được chọn
                return day.isAtSameMomentAs(_selectedDay1!) ||
                    (day.isAfter(_selectedDay1!) &&
                        day.isBefore(_selectedDay2!)) ||
                    day.isAtSameMomentAs(_selectedDay2!);
              } else if (_selectedDay1 != null) {
                // Nếu chỉ có một ngày được chọn
                return day.isAtSameMomentAs(_selectedDay1!);
              }
              // Nếu không có ngày nào được chọn
              return false;
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (_selectedDay1 == null ||
                  (_selectedDay1 != null && _selectedDay2 != null)) {
                setState(() {
                  _selectedDay1 = selectedDay;
                  _selectedDay2 = null;
                });
              } else if (_selectedDay1 != null && _selectedDay2 == null) {
                setState(() {
                  if (selectedDay.isAfter(_selectedDay1!)) {
                    _selectedDay2 = selectedDay;
                  } else {
                    _selectedDay2 = _selectedDay1;
                    _selectedDay1 = selectedDay;
                  }
                });
              }
            },
            //onDaySelected: _onDaySelected,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: InkWell(
                onTap: () {
                  // Xử lý khi button được click
                  filterRevenueByDate();
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 16, top: 10),
                  padding:
                      EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'lọc',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  // Widget caculator(){
  //   return Column(
  //       children: [
  //         TableCalendar(
  //           firstDay: DateTime.utc(2010, 10, 16),
  //           lastDay: DateTime.utc(2030, 3, 14), focusedDay: DateTime.now(),
  //           //focusedDay: _selectedDay,
  //           onDaySelected: (selectedDay, focusedDay) {
  //             setState(() {
  //               _selectedDay = selectedDay;
  //             });
  //             // Gọi hàm lọc dữ liệu tại đây
  //             filterRevenueByDate(selectedDay);
  //           },
  //         ),
  //         // Hiển thị danh sách doanh thu đã lọc tại đây
  //       ],
  //     );
  // }

  Widget notificationListView(
    BuildContext context,
    HistoryModel model,
  ) {
    return Container(
      //color: Colors.white,
      margin: const EdgeInsets.only(top: 16, left: 10, right: 10),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: Colors.white),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BillDetail(historyModel: model)),
            );
          },
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text(model.fullName!, 24, Colors.black54),
                text('Tổng tiền: ' + formatCurrency(model.total), 16,
                    Colors.black54),
                text(model.dateCreated.toString(), 16, Colors.black54),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum TimeFrame { DAY, MONTH }

TimeFrame selectedTimeFrame = TimeFrame.DAY;
