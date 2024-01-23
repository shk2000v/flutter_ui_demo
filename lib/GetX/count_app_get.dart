import 'package:get/get.dart';

class CountAppGet extends GetxController {
  int count = 0;
  int selectCount = 1;

  // UI에 상태 변경 알림이 필요 없이 내부적으로만 사용하는 변수에

  void updated(bool? isAdd) {
    if (isAdd != null) {
      if (isAdd) {
        count = count + selectCount;
        update();
      } else {
        count = count - selectCount;
        update();
      }
    } else {
      count = 0;
      update();
    }
  }

  void selected(int number) {
    selectCount = number;
    update();
  }

  @override
  void onInit() {
    count = 0;
    selectCount = 1;

    // TODO: implement onInit
    super.onInit();
  }
}
