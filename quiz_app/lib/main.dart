import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/firebase_options.dart';
import 'Controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; 
import 'GameOverScreen.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    Future<Map<String, dynamic>> fetchQuestion() async {
      final querySnapshot = await _firestore.collection('Quiz').get();
      int totalQuestions = querySnapshot.docs.length; // Get the total number of questions
      controller.totalQuestions = totalQuestions;
      if (querySnapshot.docs.isNotEmpty) {
        final doc = querySnapshot.docs[controller.currentQuestionIndex];
        return {
          'Question': doc['Question'] ?? 'No question found',
          'Options': doc['Options'] ?? 'No options found',
          'Answer': doc['Answer'] ?? 'No answer found',
        };
      } else {
        return {
          'Question': 'No question found',
          'Options': 'No options found',
          'Answer': 'No answer found',
        };
      }
    }

    return Builder(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(title),
          ),
          body: GetBuilder<ButtonController>(
            builder: (_) {
              return FutureBuilder<Map<String, dynamic>>(
                future: fetchQuestion(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}')); // Error state
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
                              snapshot.data?['Question']!,
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
                                  onPressed:() {controller.toggleButton1();
                                  if (snapshot.data?['Answer'] == 0) {
                                    Future.delayed(Duration(seconds: 1), () {
                                      controller.nextQuestion();
                                    });
                                  }else{
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
                                        ? (snapshot.data?['Answer'] == 0 ? Colors.green : Colors.red)
                                        : Colors.white,
                                  ),
                                  child: Text(
                                    snapshot.data?['Options']![0],
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 45,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed:() {controller.toggleButton2();
                                  if (snapshot.data?['Answer'] == 1) {
                                    Future.delayed(Duration(seconds: 1), () {
                                      controller.nextQuestion();
                                    });
                                  }else{
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
                                        ? (snapshot.data?['Answer'] == 1 ? Colors.green : Colors.red)
                                        : Colors.white,
                                  ),
                                  child: Text(
                                    snapshot.data?['Options']![1],
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 45,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 50),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                TextButton(
                                  onPressed:() {controller.toggleButton3();
                                  if (snapshot.data?['Answer'] == 2) {
                                    Future.delayed(Duration(seconds: 1), () {
                                      controller.nextQuestion();
                                    });
                                  }else{
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
                                        ? (snapshot.data?['Answer'] == 2 ? Colors.green : Colors.red)
                                        : Colors.white,
                                  ),
                                  child: Text(
                                    snapshot.data?['Options']![2],
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 45,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed:() {controller.toggleButton4();
                                  if (snapshot.data?['Answer'] == 3) {
                                    Future.delayed(Duration(seconds: 1), () {
                                      controller.nextQuestion();
                                    });
                                  }else{
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
                                        ? (snapshot.data?['Answer'] == 3 ? Colors.green : Colors.red)
                                        : Colors.white,
                                  ),
                                  child: Text(
                                    snapshot.data?['Options']![3],
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 45,
                                    ),
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
              );
            },
          ),
        );
      },
    );
  }
}
