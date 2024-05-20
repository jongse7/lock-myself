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
        onChanged: (text){
          if(text.length < originText.length){

          }
        },
        expands: label == 'Content',
        onSaved: onSaved,
        cursorColor: Colors.black,
        maxLines: label == 'Title' ? 1 : null,
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


