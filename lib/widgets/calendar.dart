import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  dynamic format = CalendarFormat.week;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  var dDay = DateTime.utc(1944, 6, 6);
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarFormat: format,
      focusedDay: DateTime.now(),
      firstDay: DateTime.utc(1990),
      lastDay: DateTime.utc(2050),
      onFormatChanged: (CalendarFormat _format) {
        setState(() {
          format = _format;
        });
      },
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
      //     calendarBuilders: CalendarBuilders(dowBuilder: (context, day) {
      //   if (day.weekday == DateTime.sunday) {
      //     final text = DateFormat.E().format(day);
      //     return Center(
      //       child: Text(
      //         text,
      //         style: TextStyle(color: Colors.red),
      //       ),
      //     );
      //   }
      // },),
      calendarStyle: CalendarStyle(
        selectedDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).focusColor,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(233, 225, 207, 1),
              spreadRadius: 5,
            ),
          ],
        ),
        defaultDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).primaryColor,
        ),
        weekendDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).primaryColor,
        ),
        todayDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromRGBO(120, 166, 164, 1),
        ),
      ),
    );
  }
}
