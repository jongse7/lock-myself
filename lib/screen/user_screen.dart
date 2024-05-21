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
          Logo(),
          SizedBox(height: 20),
          _Profile(),
        ],
      ),
    );
  }
}

class _Profile extends StatelessWidget {
  const _Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 500,
      decoration: BoxDecoration(
        color: Color(0XFFDBDCDE),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Column(
        children: [

        ],
      ),
    );
  }
}

