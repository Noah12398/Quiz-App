import 'package:get/get.dart';

class ButtonController extends GetxController {
  bool _isSelected1 = false;
  var _isSelected2 = false;
  var _isSelected3 = false;
  var _isSelected4 = false;
  bool get isSelected1 => _isSelected1;
  bool get isSelected2 => _isSelected2;
  bool get isSelected3 => _isSelected3;
  bool get isSelected4 => _isSelected4;

  void toggleButton1(){
    _isSelected1 = !_isSelected1;
    update();
  }
  void toggleButton2(){
    _isSelected2 = !_isSelected2;
    update();
  }
  void toggleButton3(){
    _isSelected3 = !_isSelected3;
    update();
  }
  void toggleButton4(){
    _isSelected4 = !_isSelected4;
    update();
  }
}
