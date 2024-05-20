import 'package:flutter/material.dart';
import 'diary_model.dart';

final List<DiaryModel> testDiaryListData = [
  DiaryModel(
      dateTime: DateTime(2024, 5, 1),
      title: '5월 첫날',
      content: '',
      status: 'loose'),
  DiaryModel(
      dateTime: DateTime(2024, 5, 2),
      title: '알바 면접',
      content: '',
      status: 'open'),
  DiaryModel(
      dateTime: DateTime(2024, 5, 3),
      title: '여행 계획',
      content: '',
      status: 'lock'),
  DiaryModel(
      dateTime: DateTime(2024, 5, 4),
      title: 'Flutter 스터디',
      content: '',
      status: 'loose'),
  DiaryModel(
      dateTime: DateTime(2024, 5, 5),
      title: '시험 공부',
      content: '',
      status: 'loose'),
  DiaryModel(
      dateTime: DateTime(2024, 5, 6),
      title: 'Firebase 스터디',
      content: '',
      status: 'open'),
  DiaryModel(
      dateTime: DateTime(2024, 5, 7),
      title: '학생회 회의',
      content: '',
      status: 'lock'),
  DiaryModel(
      dateTime: DateTime(2024, 5, 8),
      title: '알바 첫 출근',
      content: '',
      status: 'loose'),
];