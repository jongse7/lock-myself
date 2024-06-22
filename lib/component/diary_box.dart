import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../const/color.dart';

class DiaryBox extends StatelessWidget {
  final int? index; // 테스트용
  final List diaryData;

  const DiaryBox({required this.index, required this.diaryData, super.key});

  @override
  Widget build(BuildContext context) {
    if(index == null ||diaryData == []){
      return const Text('일기 데이터가 없습니다.');
    }else{
    return
      GestureDetector(
        onTap: (){
          showDialog(context: context, builder: (BuildContext context)
          {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              content: Stack(
                  children:[
                    Positioned(top: 5, right: 1 ,child: Text(DateFormat('yyyy.MM.dd').format(diaryData[index!].dateTime), style: TextStyle(color: PRIMARY_COLOR))),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(diaryData[index!].title, style: TextStyle(fontSize: 22.0, color: PRIMARY_COLOR)),
                        SizedBox(height: 16),
                        Text(diaryData[index!].content, style: TextStyle(color: PRIMARY_COLOR)),
                      ],
                    ),]
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('닫기', style: TextStyle(color: PRIMARY_COLOR)),
                ),
              ],
            );
          }
          );
        },
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: LIST_COLOR,
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.9),
                  blurRadius: 1.0,
                  spreadRadius: 0.0,
                  offset: const Offset(0, 1.5),
                )
              ]
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${diaryData[index!].dateTime.year}.${diaryData[index!]
                          .dateTime.month}.${diaryData[index!].dateTime.day}',
                      style: const TextStyle(
                          fontSize: 16.0,
                          color: Color(0XFF626262),
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 290,
                      child: Text(
                        diaryData[index!].title,
                        style: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: ImageIcon(
                  AssetImage(
                      "asset/icons/lock_${diaryData[index!].status}.png"),
                  size: 40.0,
                  color: PRIMARY_COLOR,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
