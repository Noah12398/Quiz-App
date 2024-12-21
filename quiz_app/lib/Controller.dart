import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'quiz_model.dart'; // Import the quiz model

class ButtonController extends GetxController {
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;
  int currentQuestionIndex = 0;
  int Score = 0;
  int totalQuestions = 0;

  @override
  void onInit() {
    super.onInit();
    // Load total number of questions
    final quizBox = Hive.box<Quiz>('quizBox');
    totalQuestions = quizBox.length;
  }

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
      Score = Score + 5;
      update();
    } else {
      Get.snackbar(
        'Quiz Completed',
        'You have answered all the questions!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: const Color.fromARGB(255, 17, 13, 13),
        margin: const EdgeInsets.all(16),
      );
    }
  }

  void resetQuiz() {
    currentQuestionIndex = 0;
    isSelected1 = false;
    isSelected2 = false;
    isSelected3 = false;
    isSelected4 = false;
    Score = 0;
    update();
  }

  Quiz? getCurrentQuestion() {
    final quizBox = Hive.box<Quiz>('quizBox');
    if (currentQuestionIndex < totalQuestions) {
      return quizBox.getAt(currentQuestionIndex);
    }
    return null;
  }
}
