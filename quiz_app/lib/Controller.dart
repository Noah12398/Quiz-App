import 'package:get/get.dart';

class ButtonController extends GetxController {
  var isSelected1 = false.obs;
  var isSelected2 = false.obs;
  var isSelected3 = false.obs;
  var isSelected4 = false.obs;

  void toggleButton1() => isSelected1.value = !isSelected1.value;
  void toggleButton2() => isSelected2.value = !isSelected2.value;
  void toggleButton3() => isSelected3.value = !isSelected3.value;
  void toggleButton4() => isSelected4.value = !isSelected4.value;
}
