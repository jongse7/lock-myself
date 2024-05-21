import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:lock_myself/component/custom_text_field.dart';
import 'package:lock_myself/const/color.dart';
import 'package:lock_myself/screen/home_screen.dart';

import '../main.dart';
import '../model/diary_model.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? title;
  String? content;
  int backspaceCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: renderAppbar(),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              _Title(onTitleSaved: (String? val) {
                title = val;
              }),
              _Content(
                onContentSaved: (String? val) {
                  content = val;
                },
              ),
              _SubmitButton(onSavePressed: onSavePressed,),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget renderAppbar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        '일기 작성',
        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 23.0),
      ),
      centerTitle: true,
      toolbarHeight: 120,
      leading: IconButton(
        icon: ImageIcon(
          AssetImage("asset/icons/left_arrow.png"),
          size: 27.5,
        ),
        padding: EdgeInsets.only(left: 25.0, top: 5),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  void onSavePressed() {
    // formKey는 생성을 했는데
    // Form 위젯과 결합을 안했을때
    // 다른 개발자의 실수를 대비 예외처리
    if (formKey.currentState == null) {
      return;
    }
    // 모든 하위 TextFormField의 validate에서 null을 return할 때
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      DiaryModel diaryModel = DiaryModel(dateTime: DateTime.now(), title: title!, content: content!, status: 'lock');
      final box = Hive.box<DiaryModel>(diaryBox);
      box.put(DateTime.now().toString(),diaryModel);
    }
    // 하위 TextFormField의 validate에서 에러(text)를 return할 때
    else {
      print('에러가 있습니다.');
    }
    Navigator.of(context).pop();
  }
}

class _Title extends StatelessWidget {
  final FormFieldSetter<String> onTitleSaved;
  const _Title({required this.onTitleSaved, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        label: 'Title', labelText: '제목을 작성해주세요', onSaved: onTitleSaved);
  }
}

class _Content extends StatelessWidget {
  final FormFieldSetter<String> onContentSaved;
  const _Content({required this.onContentSaved, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: CustomTextField(
      label: 'Content',
      labelText: '일기를 작성해주세요',
      onSaved: onContentSaved,
    ));
  }
}

class _SubmitButton extends StatelessWidget {
  final VoidCallback onSavePressed;
  const _SubmitButton({required this.onSavePressed,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 2.0, color: Color(0XFFE0E0E0)),
        ),
      ),
      child: Center(
        child: _SaveButton(
          onPressed: onSavePressed,
        ),
      ),
    );
  }
}

class _SaveButton extends StatelessWidget {
  final VoidCallback onPressed;
  const _SaveButton({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(27.5),
          ),
          backgroundColor: PRIMARY_COLOR,
        ),
        child: Text(
          '작성완료',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
