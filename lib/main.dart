import 'package:flutter/material.dart';
import 'package:lock_myself/screen/home_screen.dart';
import 'package:lock_myself/screen/navigation_bar_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'model/diary_model.dart';

const diaryBox = 'diaryBox';

void main() async{
  // flutter 재실행
  await Hive.initFlutter();
  // Hive에 타입 주입
  Hive.registerAdapter<DiaryModel>(DiaryModelAdapter());
  // box를 열어 로컬디스크에 데이터를 저장하거나 꺼낼 수 있음
  await Hive.openBox<DiaryModel>(diaryBox);
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: 'NotoSans'),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: NavigationBarScreen(),
    ),
  );
}
