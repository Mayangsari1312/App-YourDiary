import 'package:flutter/material.dart';
import 'package:yourdiary3/theme.dart';
import 'package:table_calendar/table_calendar.dart';

class Cal extends StatefulWidget {
  const Cal({super.key});

  @override
  State<Cal> createState() => _CalState();
}

class _CalState extends State<Cal> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: Container(
            decoration: BoxDecoration(
                color: blue2Color, borderRadius: BorderRadius.circular(20)),
            child: TableCalendar(
              locale: "en_US",
              rowHeight: 35,
              daysOfWeekHeight: 40,
              headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: boldTextStyle.copyWith(color: Colors.white),
                  decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)))),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: boldTextStyle,
                weekendStyle: boldTextStyle,
              ),
              availableGestures: AvailableGestures.all,
              focusedDay: DateTime.now(),
              firstDay: DateTime(2010, 10, 16),
              lastDay: DateTime(2030, 3, 14),
              onDaySelected: _onDaySelected,
              selectedDayPredicate: (day) => isSameDay(day, today),
              calendarStyle: CalendarStyle(
                defaultTextStyle: lightTextStyle,
                outsideDaysVisible: false,
                todayDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
