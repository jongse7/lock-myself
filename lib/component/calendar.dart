import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../const/color.dart';
import '../model/diary_model.dart';

class Calendar extends StatelessWidget {
  final DateTime focusedDay;
  final DateTime selectedDay;
  final OnDaySelected onDaySelected;
  final List<DiaryModel> allDiaryData;

  const Calendar(
      {required this.focusedDay,
        required this.selectedDay,
        required this.onDaySelected,
        required this.allDiaryData,
        super.key});

  @override
  Widget build(BuildContext context) {
    final defaultBoxDeco = BoxDecoration(
      borderRadius: BorderRadius.circular(6.0),
      color: Colors.grey[200],
    );

    final defaultTextStyle = TextStyle(
      color: Colors.grey[600],
      fontWeight: FontWeight.w700,
      fontSize: 16.0,
    );

    final selectedBoxDeco = defaultBoxDeco.copyWith(
      color: Colors.white,
      border: Border.all(
        color: PRIMARY_COLOR,
        width: 2.0,
      ),
    );

    final selectedTextStyle = defaultTextStyle.copyWith(
      color: PRIMARY_COLOR,
    );

    Widget customDayBuilder(
        bool isSelected,
        DateTime day,
        BoxDecoration decoration,
        TextStyle textStyle,
        ) {
      bool hasDiary = allDiaryData.any((diary) =>
      diary.dateTime.year == day.year &&
          diary.dateTime.month == day.month &&
          diary.dateTime.day == day.day);

      return Container(
        decoration: decoration,
        margin: const EdgeInsets.all(4.0),
        child: Center(
          child: Text(
            '${day.day}',
            style: hasDiary ? textStyle : textStyle.copyWith(color: Color(0xFFD3D1D1)),
          ),
        ),
      );
    }

    return TableCalendar(
      locale: "ko_KR",
      focusedDay: focusedDay,
      firstDay: DateTime(1800),
      lastDay: DateTime(3000),
      daysOfWeekHeight: 20,
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16.0,
        ),
      ),
      calendarStyle: CalendarStyle(
        isTodayHighlighted: false,
        defaultDecoration: defaultBoxDeco,
        weekendDecoration: defaultBoxDeco,
        selectedDecoration: selectedBoxDeco,
        outsideDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(6),
        ),
        defaultTextStyle: defaultTextStyle,
        weekendTextStyle: defaultTextStyle,
        selectedTextStyle: selectedTextStyle,
      ),
      onDaySelected: onDaySelected,
      selectedDayPredicate: (DateTime dateTime) {
        return dateTime.year == selectedDay.year &&
            dateTime.month == selectedDay.month &&
            dateTime.day == selectedDay.day;
      },
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) {
          return customDayBuilder(
            false,
            day,
            defaultBoxDeco,
            defaultTextStyle,
          );
        },
        selectedBuilder: (context, day, focusedDay) {
          return customDayBuilder(
            true,
            day,
            selectedBoxDeco,
            selectedTextStyle,
          );
        },
        todayBuilder: (context, day, focusedDay) {
          return customDayBuilder(
            false,
            day,
            defaultBoxDeco,
            defaultTextStyle,
          );
        },
        outsideBuilder: (context, day, focusedDay) {
          return customDayBuilder(
            false,
            day,
            defaultBoxDeco.copyWith(color: Colors.white),
            defaultTextStyle.copyWith(color: Color(0XFFAEAEAE), fontWeight: FontWeight.w300),
          );
        },
      ),
    );
  }
}