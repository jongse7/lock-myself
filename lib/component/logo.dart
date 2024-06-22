import 'package:flutter/material.dart';
import '../const/color.dart';

// 우측 상단 Lock Myself 로고
class Logo extends StatelessWidget {
  final bool isSplash;
  final double rightPadding;

  const Logo({
    this.isSplash = false,
    Key? key,
    this.rightPadding = 0.0, // 기본값 설정
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isSplash ? EdgeInsets.zero : EdgeInsets.only(top: 30.0, right: 27.5 + rightPadding),
      child: Align(
        alignment: isSplash ? Alignment.center : Alignment.centerRight,
        child: Text(
          'Lock Myself',
          style: TextStyle(
            fontSize: 30,
            color: isSplash ? LIST_COLOR : PRIMARY_COLOR,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
