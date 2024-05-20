import 'package:hive/hive.dart';
part 'diary_model.g.dart';

@HiveType(typeId: 1)
class DiaryModel {
  @HiveField(0)
  final DateTime dateTime;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String content;
  @HiveField(3)
  final String status;

  DiaryModel({
    required this.dateTime,
    required this.title,
    required this.content,
    required this.status,
  });
}
