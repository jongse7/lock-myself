import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/services.dart';
import 'package:lock_myself/screen/splash_screen.dart';
import 'model/diary_model.dart';

// Hive box 이름 정의
const diaryBox = 'diaryBox';
const userBox = 'userBox';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Flutter 초기화
  await Hive.initFlutter();
  // Hive에 타입 등록
  Hive.registerAdapter<DiaryModel>(DiaryModelAdapter());
  // Box 열기
  await Hive.openBox<DiaryModel>(diaryBox);
  await Hive.openBox(userBox);
  // 어플 첫 실행 시 유저 박스 초기화
  final box = Hive.box(userBox);
  if (box.isEmpty) {
    box.putAll({
      'image': null,
      'nickName': '',
      'intro' : '',
      'totalNumber': 0,
      'totalBackspace': 0,
      'challengeDay': 0,
      'averageBackspace': 0,
    });
  }

  await initializeDateFormatting();
  // 화면 방향 고정 (세로 고정 예시)
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: 'NotoSans'),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  );
}
