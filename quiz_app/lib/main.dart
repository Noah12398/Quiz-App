import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/firebase_options.dart';
import 'Controller.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Cloud Firestore
void main() async{
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
      home:  MyHomePage(title: 'QUIZ'),
      debugShowCheckedModeBanner :false
    );
  }
}

class MyHomePage extends StatelessWidget {
   MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
        String Question;
        final ButtonController controller = Get.put(ButtonController());
        final FirebaseFirestore _firestore = FirebaseFirestore.instance;
        Future<String> fetchQuestion() async {
            final querySnapshot = await _firestore.collection('Quiz').get();
if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs[0]['Question'] ?? 'No question found';
    }else{
      return "No Questions";
    }
    }
    return Builder(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(title),
          ),
           body:GetBuilder<ButtonController>(
             builder: (_) {
               return FutureBuilder<String>(
                future: fetchQuestion(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}')); // Error state
                  }
                   return Stack(
                  children: <Widget>[
                    Align(alignment: Alignment.topRight,
                    child:Text('Score',textAlign:TextAlign.right,style: TextStyle(fontSize: 50),) ,),
                    Center(
                      child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                     Text(
                      snapshot.data!,style: TextStyle( color: Colors.amber,fontStyle:FontStyle.normal,fontSize:75),
                    ),
                  const SizedBox(height:50),
                   Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                  TextButton(
                              onPressed: controller.toggleButton1,
                              style: TextButton.styleFrom(
                                backgroundColor:controller.isSelected1
                                      ? Colors.green
                                      : Colors.white,),
                              child: const Text(
                                'Option 1',
                                style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 45,
                                ),
                              ),
                            ),
                          TextButton(
                              onPressed: controller.toggleButton2,
                              style: TextButton.styleFrom(
                                backgroundColor:controller.isSelected2
                                      ? Colors.green
                                      : Colors.white,),
                              child: const Text(
                                'Option 2',
                                style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 45,
                                ),
                              ),
                            ),
                  ],
                    ),
                    const SizedBox(height:50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                TextButton(
                              onPressed: controller.toggleButton3,
                              style: TextButton.styleFrom(
                                backgroundColor:controller.isSelected3
                                      ? Colors.green
                                      : Colors.white,),
                              child: const Text(
                                'Option 3',
                                style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 45,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: controller.toggleButton4,
                              style: TextButton.styleFrom(
                                backgroundColor:controller.isSelected4
                                      ? Colors.green
                                      : Colors.white,),
                              child: const Text(
                                'Option 4',
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
                }
               );
             }
           )
        );
      }
    );
  }
}
