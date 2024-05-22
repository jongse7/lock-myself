import 'package:flutter/material.dart';
import 'package:lock_myself/component/logo.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Logo(
            rightPadding: 12.0,
          ),
          SizedBox(height: 20),
          _ProfileBox(),
        ],
      ),
    );
  }
}

class _ProfileBox extends StatelessWidget {
  const _ProfileBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 500,
      decoration: BoxDecoration(
        color: Color(0XFFDBDCDE),
        borderRadius: BorderRadius.circular(27.5),
      ),
      child: Column(
        children: [
          _Profile(),
          _Introduce(),
          Row(
            children: [
              Column(),
              Column(),
            ],
          ),
        ],
      ),
    );
  }
}

class _Profile extends StatelessWidget {
  const _Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(color: Colors.blue),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 17.5),
            child: Text(
              '닉네임',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}

class _Introduce extends StatelessWidget {
  const _Introduce({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 325,
      decoration: BoxDecoration(
        color: Color(0XFFE9ECEF),
        borderRadius: BorderRadius.circular(12.5),
      ),
      child: Padding(
        padding: EdgeInsets.only(top:10, left:15),
        child: Text(
          '한줄소개',
          style: TextStyle(fontSize: 17.5),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}

