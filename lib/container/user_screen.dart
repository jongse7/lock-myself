import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lock_myself/component/info_box.dart';
import 'package:lock_myself/component/logo.dart';
import 'package:lock_myself/main.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Logo(rightPadding: 12.0),
              _ProfileBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileBox extends StatefulWidget {
  const _ProfileBox({Key? key}) : super(key: key);

  @override
  State<_ProfileBox> createState() => _ProfileBoxState();
}

class _ProfileBoxState extends State<_ProfileBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        width: 360,
        height: 575,
        decoration: BoxDecoration(
          color: Color(0XFFDBDCDE),
          borderRadius: BorderRadius.circular(27.5),
        ),
        child: Column(
          children: [
            _Profile(onTap: onProfileTap),
            _Introduce(),
            _InfoBoxList(),
            Image.asset('asset/images/running_man.png', height: 100),
          ],
        ),
      ),
    );
  }

  void onProfileTap() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      setState(() {
        final box = Hive.box(userBox);
        box.put('image', image.path); // 파일 경로 저장
      });
    }
  }
}

class _Profile extends StatefulWidget {
  final VoidCallback onTap;

  const _Profile({required this.onTap, super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<_Profile> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  final int _maxLength = 8;
  bool _showCounter = false;

  @override
  void initState() {
    super.initState();
    final box = Hive.box(userBox);
    _controller.text = box.get('nickName', defaultValue: '');

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        box.put('nickName', _controller.text);
        setState(() {
          _showCounter = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: ValueListenableBuilder(
        valueListenable: Hive.box(userBox).listenable(),
        builder: (BuildContext context, Box box, Widget? child) {
          final imagePath = box.get('image');

          return Column(
            children: [
              GestureDetector(
                onTap: widget.onTap,
                child: imagePath == null
                    ? Image.asset(
                        'asset/images/defaultProfile.png',
                        width: 110,
                      )
                    : ClipOval(
                        child: Image.file(File(imagePath),
                            width: 110, fit: BoxFit.cover),
                      ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 7.5),
                child: SizedBox(
                  width: 150,
                  height: 75,
                  child: TextField(
                    focusNode: _focusNode,
                    controller: _controller,
                    textAlign: TextAlign.center,
                    maxLength: _maxLength,
                    decoration: InputDecoration(
                      hintText: '닉네임',
                      hintStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      border: InputBorder.none,
                      counterText: _showCounter
                          ? '${_controller.text.length} / $_maxLength'
                          : '',
                      counterStyle: TextStyle(height: 0.1),
                    ),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                    onChanged: (text) {
                      setState(() {
                        _showCounter = true;
                      });
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _Introduce extends StatefulWidget {
  const _Introduce({super.key});

  @override
  __IntroduceState createState() => __IntroduceState();
}

class __IntroduceState extends State<_Introduce> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final int _maxLength = 38; // 최대 입력 길이 설정

  @override
  void initState() {
    super.initState();
    final box = Hive.box(userBox);
    _controller.text = box.get('intro', defaultValue: '');

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        box.put('intro', _controller.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(userBox).listenable(),
      builder: (BuildContext context, Box box, Widget? child) {
        return Container(
          height: 80,
          width: 335,
          decoration: BoxDecoration(
            color: Color(0XFFE9ECEF),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              maxLines: null,
              maxLength: _maxLength,
              decoration: InputDecoration(
                hintText: '한줄소개',
                border: InputBorder.none,
                counterText: '', // 글자 제한 문구 제거
              ),
              style: TextStyle(fontSize: 16),
              onChanged: (text) {
                if (_controller.text.split('\n').length > 2) {
                  _controller.text = _controller.text
                      .substring(0, _controller.text.length - 1);
                  _controller.selection = TextSelection.fromPosition(
                      TextPosition(offset: _controller.text.length));
                }
              },
            ),
          ),
        );
      },
    );
  }
}

class _InfoBoxList extends StatelessWidget {
  const _InfoBoxList({super.key});

  @override
  Widget build(BuildContext context) {
    final userData = Hive.box(userBox);
    Map<String, String> info = {
      '총 기록 갯수': userData.get('totalNumber').toString(),
      '누적된        횟수': userData.get('totalBackspace').toString(),
      '기록 챌린지': userData.get('challengeDay').toString(),
      '평균        횟수': userData.get('averageBackspace').toStringAsFixed(3)
    };
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12.0, right: 12.0, left: 12.0),
          child: SizedBox(
            height: 150,
            child: GridView.count(
              // 주축이 세로, 가로축 개수
              crossAxisCount: 2,
              // 가로축 간의 간격
              crossAxisSpacing: 12.0,
              // 주축 간의 간격
              mainAxisSpacing: 12.0,
              childAspectRatio: 2.5,
              children: info.entries
                  .map((entries) =>
                      InfoBox(title: entries.key, content: entries.value))
                  .toList(),
            ),
          ),
        ),
        Positioned(
          right: 70,
          top: 25.5,
          child: Image.asset('asset/icons/backspace.png'),
          width: 17.5,
        ),
        Positioned(
          right: 77.5,
          top: 101.5,
          child: Image.asset('asset/icons/backspace.png'),
          width: 17.5,
        ),
      ],
    );
  }
}
