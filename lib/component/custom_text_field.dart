import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String labelText;
  final FormFieldSetter<String> onSaved;
  const CustomTextField({required this.label,required this.labelText, required this.onSaved, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w700),),
        SizedBox(
          width: 285,
          child: TextFormField(
            onSaved: onSaved,
            cursorColor: Colors.black,
            maxLines: label == 'Title' ? 1 : null,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.red,
              border: InputBorder.none,
              labelText: labelText,
              labelStyle: TextStyle(
                fontSize: 20.0,
                color: Color(0XFF899498),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
            textAlignVertical: TextAlignVertical(y : -1.0),
          ),
        ),
      ],
    );
  }
}
