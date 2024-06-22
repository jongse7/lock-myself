import 'package:hive/hive.dart';
import 'package:lock_myself/main.dart';

class DataUtils{
  // 백스페이스 개수로 자물쇠 상태 정하는 로직
  static String backspaceToStatus(backspaceCount){
    String status;
    // 자물쇠 잠금 상태 변수 status 초기화
    if(backspaceCount >= 0 && backspaceCount < 10){
      status = 'open';
    }else if(backspaceCount >= 10 && backspaceCount < 25){
      status = 'loose';
    }else{
      status = 'lock';
    }
    return status;
  }

  // 새로 작성한 날짜와 기존 로컬데이터에서 최신 날짜를 비교해 challengeDay를 계산하는 로직
  static int updateChallengeDay(int challengeDay, DateTime newDate, DateTime? lastDate) {
    // 첫 일기 작성 시
    if(lastDate == null){
      return 1;
    }
    // 꾸준히 썼을 때
    final difference = newDate.difference(lastDate).inDays;
    if (difference == 1) {
      return challengeDay + 1;
    }
    // 꾸준히 안 썼을 때
    else if (difference > 1) {
      return 0;
    }

    return challengeDay;
  }
}