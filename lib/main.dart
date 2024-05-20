import 'package:flutter/material.dart';
import 'package:lock_myself/screen/home_screen.dart';
import 'package:lock_myself/screen/navigation_bar_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: 'NotoSans'),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: NavigationBarScreen(),
    ),
  );
}
