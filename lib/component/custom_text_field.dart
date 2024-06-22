import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lock_myself/screen/diary_screen.dart';

class CustomTextField extends StatelessWidget {
  final List<TextInputFormatter> backspaceTextInputFormatter;
  final TextEditingController controller;
  final String label;
  final String labelText;
  final FormFieldSetter<String> onSaved;
  const CustomTextField({required this.backspaceTextInputFormatter,required this.controller,required this.label,required this.labelText, required this.onSaved, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w700),),
        if(label == 'Title') renderTextField(),
        if(label == 'Content') Expanded(child: renderTextField()),
      ],
    );
  }

  Widget renderTextField(){
    final String originText = '';
    return SizedBox(
      width: 285,
      child: TextFormField(
        controller: controller,
        inputFormatters: backspaceTextInputFormatter,
        expands: label == 'Content',
        onSaved: onSaved,
        cursorColor: Colors.black,
        maxLines: label == 'Title' ? 1 : null,
        maxLength: label == 'Title' ? 12 : 500,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 20.0,
            color: Color(0XFF899498),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
        textAlignVertical: TextAlignVertical.top,
      ),
    );
  }
}


