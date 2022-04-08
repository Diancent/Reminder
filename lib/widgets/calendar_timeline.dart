import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return CalendarTimeline(
      initialDate: DateTime.now(),
      firstDate: DateTime(2020, 11, 1),
      lastDate: DateTime(2022, 1, 29),
      onDateSelected: (date) => print(date),
      leftMargin: 20,
      // monthColor: Color.fromRGBO(191, 190, 196, 1),
      monthColor: Color.fromRGBO(59, 59, 58, 1),
      dayColor: Color.fromRGBO(115, 115, 115, 1),
      activeBackgroundDayColor: Color.fromRGBO(235, 186, 23, 1),
    );
  }
}
