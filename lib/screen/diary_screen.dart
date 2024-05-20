import 'package:flutter/material.dart';
import 'package:lock_myself/component/custom_text_field.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey();
    String? title;
    String? content;

    return Scaffold(
      appBar: renderAppbar(),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 00.0),
              child: Column(
                children: [
                  CustomTextField(
                      label: 'Title',
                      labelText: '제목을 작성해주세요',
                      onSaved: (String? val) {
                        content = val;
                      }),
                  CustomTextField(
                      label: 'Content',
                      labelText: '일기를 작성해주세요',
                      onSaved: (String? val) {
                        content = val;
                      })
                ],
              ),
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 2.0, color: Color(0XFFE0E0E0)),
                ),
              ),
              child: Center(
                child: butt,
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget renderAppbar(){
    return AppBar(
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
}
