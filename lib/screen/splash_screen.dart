import 'package:flutter/material.dart';
import 'package:lock_myself/component/logo.dart';
import 'package:lock_myself/const/color.dart';
import 'dart:async';
import '../component/custom_navigation_bar.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 2), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => CustomNavigationBar()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DARK_COLOR,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset('asset/images/logo.png', width: 200,),SizedBox(height:150),Logo(isSplash: true,),]
      ),
    );
  }
}