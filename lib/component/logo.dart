import 'package:flutter/material.dart';
import '../const/color.dart';

// 우측 상단 Lock Myself 로고
class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 30.0, right: 27.5),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          'Lock Myself',
          style: TextStyle(
            fontSize: 34,
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.w400
          ),
        ),
      ),
    );
  }
}
