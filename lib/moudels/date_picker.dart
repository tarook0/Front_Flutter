import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:my_app/screens/Home/add_a_product/add_product.dart';


late int maxY ;
late int maxM ;
late int maxD ;
class DateExpirePicker extends StatefulWidget {
  const DateExpirePicker({Key? key}) : super(key: key);

  @override
  _DateExpirePickerState createState() => _DateExpirePickerState();
}

class _DateExpirePickerState extends State<DateExpirePicker> {
  DateTime  todaydate =DateTime.now();

    late int  d = todaydate.day +4 ;
    late int  m = todaydate.month;
    late int  y = todaydate.year;

  late int  max =2050;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 150,

        child: buildDatepicker(),
      ),
    );
  }
  Widget buildDatepicker() => CupertinoDatePicker(
    initialDateTime: todaydate.add(Duration(days: 7)),
    mode: CupertinoDatePickerMode.date,
   minimumDate:  DateTime(y,m,d),

    onDateTimeChanged: (date) => setState(() {
      this.todaydate =date;
      maxD = date.day;
      maxM = date.month;
      maxY =date.year;
    }),
  );
}




