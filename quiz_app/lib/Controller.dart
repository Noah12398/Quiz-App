import 'package:get/get.dart';

class ButtonController extends GetxController {
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;
  int currentQuestionIndex = 0;
  int Score=0;
  int totalQuestions=0;
  void toggleButton1() {
    isSelected1 = true;
    isSelected2 = false;
    isSelected3 = false;
    isSelected4 = false;
    update();
  }

  void toggleButton2() {
    isSelected1 = false;
    isSelected2 = true;
    isSelected3 = false;
    isSelected4 = false;
    update();
  }

  void toggleButton3() {
    isSelected1 = false;
    isSelected2 = false;
    isSelected3 = true;
    isSelected4 = false;
    update();
  }

  void toggleButton4() {
    isSelected1 = false;
    isSelected2 = false;
    isSelected3 = false;
    isSelected4 = true;
    update();
  }

    void nextQuestion() {
    if (currentQuestionIndex < totalQuestions - 1) {
      currentQuestionIndex++;
      isSelected1 = false;
      isSelected2 = false;
      isSelected3 = false;
      isSelected4 = false;
      Score=Score+5;
      update();
    } else {
      Get.snackbar('Quiz Completed', 'You have answered all the questions!');
    }
  }

  void resetQuiz() {
    currentQuestionIndex=0;
    Score=0;
    update(); // Notify listeners that the state has been reset

  }
}

