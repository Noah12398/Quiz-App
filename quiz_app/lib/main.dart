import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Controller.dart';
import 'GameOverScreen.dart';
import 'quiz_model.dart';
import 'package:get/get.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(QuizAdapter()); // Register the Quiz adapter
  await Hive.openBox<Quiz>('quizBox'); // Open the box to store quiz data
  await storeQuizData(); // Store quiz questions in the database
  runApp(const MyApp());
}

Future<void> storeQuizData() async {
  final box = await Hive.openBox<Quiz>('quizBox');

  // Define quiz questions and options
  final questions = [
    Quiz(
  question: 'Which programming language is used to write Flutter apps?',
  options: ['Dart', 'Java', 'C++', 'Kotlin'],
  answer: 0, // Correct answer: 'Dart'
),
Quiz(
  question: 'Who is the creator of Flutter?',
  options: ['Google', 'Facebook', 'Apple', 'Microsoft'],
  answer: 0, // Correct answer: 'Google'
),
Quiz(
  question: 'Which of these is an advantage of Flutter?',
  options: ['Faster development', 'Native performance', 'Beautiful UIs', 'All of the above'],
  answer: 3, // Correct answer: 'All of the above'
),
Quiz(
  question: 'What is the default programming language used for Android development?',
  options: ['Kotlin', 'Java', 'C++', 'Python'],
  answer: 0, // Correct answer: 'Kotlin'
),
Quiz(
  question: 'What is the capital of the United States?',
  options: ['New York', 'Washington, D.C.', 'Los Angeles', 'Chicago'],
  answer: 1, // Correct answer: 'Washington, D.C.'
),
Quiz(
  question: 'Which company developed Android?',
  options: ['Apple', 'Google', 'Microsoft', 'Samsung'],
  answer: 1, // Correct answer: 'Google'
),
Quiz(
  question: 'What does HTTP stand for?',
  options: ['HyperText Transfer Protocol', 'HyperText Transmission Protocol', 'Hyper Transfer Text Protocol', 'HyperText Transmission Platform'],
  answer: 0, // Correct answer: 'HyperText Transfer Protocol'
),
Quiz(
  question: 'What is the main purpose of Git?',
  options: ['To create websites', 'Version control', 'Database management', 'Code compilation'],
  answer: 1, // Correct answer: 'Version control'
),
Quiz(
  question: 'Which of the following is a database management system?',
  options: ['Python', 'MySQL', 'JavaScript', 'Flutter'],
  answer: 1, // Correct answer: 'MySQL'
),
Quiz(
  question: 'Which of these is a valid Flutter widget?',
  options: ['TextField', 'ButtonWidget', 'ListItem', 'ContainerBox'],
  answer: 0, // Correct answer: 'TextField'
),

    // Add more questions as needed
  ];

  // Store questions in the Hive box
  for (var question in questions) {
    await box.add(question);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Quiz App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'QUIZ'),
      debugShowCheckedModeBanner: false,
    );
  }
}
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final ButtonController controller = Get.put(ButtonController());
    final Box quizBox = Hive.box<Quiz>('quizBox');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: GetBuilder<ButtonController>(
        builder: (_) {
          // Fetch the current question
          Quiz? currentQuestion = controller.getCurrentQuestion();
          if (currentQuestion == null) {
            return Center(child: Text('No more questions'));
          }

          return Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  'Score: ${controller.Score}',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 50),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      currentQuestion.question,
                      style: TextStyle(
                          color: Colors.amber,
                          fontStyle: FontStyle.normal,
                          fontSize: 75),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            controller.toggleButton1();
                            if (currentQuestion.answer == 0) {
                              Future.delayed(Duration(seconds: 1), () {
                                controller.nextQuestion();
                              });
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GameOverScreen(
                                    onRestart: () {
                                      Navigator.pop(context);
                                      controller.resetQuiz();
                                    },
                                  ),
                                ),
                              );
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: controller.isSelected1
                                ? (currentQuestion.answer == 0
                                    ? Colors.green
                                    : Colors.red)
                                : Colors.white,
                          ),
                          child: Text(
                            currentQuestion.options[0],
                            style: TextStyle(fontSize: 45),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            controller.toggleButton2();
                            if (currentQuestion.answer == 1) {
                              Future.delayed(Duration(seconds: 1), () {
                                controller.nextQuestion();
                              });
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GameOverScreen(
                                    onRestart: () {
                                      Navigator.pop(context);
                                      controller.resetQuiz();
                                    },
                                  ),
                                ),
                              );
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: controller.isSelected2
                                ? (currentQuestion.answer == 1
                                    ? Colors.green
                                    : Colors.red)
                                : Colors.white,
                          ),
                          child: Text(
                            currentQuestion.options[1],
                            style: TextStyle(fontSize: 45),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            controller.toggleButton3();
                            if (currentQuestion.answer == 2) {
                              Future.delayed(Duration(seconds: 1), () {
                                controller.nextQuestion();
                              });
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GameOverScreen(
                                    onRestart: () {
                                      Navigator.pop(context);
                                      controller.resetQuiz();
                                    },
                                  ),
                                ),
                              );
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: controller.isSelected3
                                ? (currentQuestion.answer == 2
                                    ? Colors.green
                                    : Colors.red)
                                : Colors.white,
                          ),
                          child: Text(
                            currentQuestion.options[2],
                            style: TextStyle(fontSize: 45),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            controller.toggleButton4();
                            if (currentQuestion.answer == 3) {
                              Future.delayed(Duration(seconds: 1), () {
                                controller.nextQuestion();
                              });
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GameOverScreen(
                                    onRestart: () {
                                      Navigator.pop(context);
                                      controller.resetQuiz();
                                    },
                                  ),
                                ),
                              );
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: controller.isSelected4
                                ? (currentQuestion.answer == 3
                                    ? Colors.green
                                    : Colors.red)
                                : Colors.white,
                          ),
                          child: Text(
                            currentQuestion.options[3],
                            style: TextStyle(fontSize: 45),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
