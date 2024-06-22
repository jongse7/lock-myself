import 'package:flutter/material.dart';
import 'package:lock_myself/const/color.dart';

class InfoBox extends StatelessWidget {
  final String title;
  final String content;
  const InfoBox({required this.title, required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffE9ECEF),
        borderRadius: BorderRadius.circular(7.5),
      ),
      child: Column(
        children: [
          SizedBox(height:8.0),
          Text(title, style: TextStyle(color: Color(0xff626262), fontWeight: FontWeight.w700, fontSize: 15.0),),
          Text(content, style: TextStyle(color: PRIMARY_COLOR, fontWeight: FontWeight.w700, fontSize: 17.5)),
        ],
      ),
    );
  }
}
