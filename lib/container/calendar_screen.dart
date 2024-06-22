import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lock_myself/component/today_banner.dart';
import 'package:lock_myself/main.dart';
import '../component/calendar.dart';
import '../component/diary_box.dart';
import '../model/diary_model.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime selectedDay = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ValueListenableBuilder(
        valueListenable: Hive.box<DiaryModel>(diaryBox).listenable(),
        builder: (context, box, widget) {
          List<DiaryModel> allDiary = List.from(box.values.toList().reversed);
          List<DiaryModel> selectedDiary =
              getSelectedDiary(allDiary, selectedDay);
          bool selectedDiaryIsEmpty = selectedDiary.isEmpty;
          return Column(
            children: [
              Expanded(
                flex: 5,
                child: Calendar(
                  selectedDay: selectedDay,
                  focusedDay: focusedDay,
                  onDaySelected: onDaySelected,
                  allDiaryData: allDiary,
                ),
              ),
              TodayBanner(
                selectedDay: selectedDay,
                selectedDiaryNum: selectedDiary.length,
              ),
              Expanded(
                flex: 3,
                child: selectedDiaryIsEmpty
                    ? Center(
                        child: Text(
                          '작성한 일기가 없습니다',
                          style: TextStyle(
                              color: Color(0xff899498), fontSize: 17.5),
                        ),
                      )
                    : ListView.builder(
                        itemCount: selectedDiary.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: DiaryBox(
                              index: index,
                              diaryData: selectedDiary,
                            ),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
      this.focusedDay = selectedDay;
    });
  }

  List<DiaryModel> getSelectedDiary(
      List<DiaryModel> allDiary, DateTime selectedDay) {
    List<DiaryModel> selectedDiary = [];
    for (int i = 0; i < allDiary.length; i++) {
      if (allDiary[i].dateTime == selectedDay) {
        selectedDiary.add(allDiary[i]);
      } else if (DateTime.parse(selectedDay.toString())
          .isAfter(DateTime.parse(allDiary[i].dateTime.toString()))) {
        break;
      }
    }
    return selectedDiary;
  }
}
