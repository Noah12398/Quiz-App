import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controller.dart';
void main() {
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner :false
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
        final ButtonController controller = Get.put(ButtonController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
       body:  Stack(
          children: <Widget>[
            Align(alignment: Alignment.topRight,
            child:Text('Score',textAlign:TextAlign.right,style: TextStyle(fontSize: 50),) ,),
            Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
             Text(
              'What ius your name',style: TextStyle( color: Colors.amber,fontStyle:FontStyle.normal,fontSize:75),
            ),
          const SizedBox(height:50),
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
          Obx(() => TextButton(
                      onPressed: controller.toggleButton1,
                      style: TextButton.styleFrom(
                        backgroundColor:controller.isSelected1.value
                              ? Colors.green
                              : Colors.white,),
                      child: const Text(
                        'Option 1',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 45,
                        ),
                      ),
                    )),
                  Obx(() => TextButton(
                      onPressed: controller.toggleButton2,
                      style: TextButton.styleFrom(
                        backgroundColor:controller.isSelected2.value
                              ? Colors.green
                              : Colors.white,),
                      child: const Text(
                        'Option 2',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 45,
                        ),
                      ),
                    )),
          ],
            ),
            const SizedBox(height:50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
        Obx(() => TextButton(
                      onPressed: controller.toggleButton3,
                      style: TextButton.styleFrom(
                        backgroundColor:controller.isSelected3.value
                              ? Colors.green
                              : Colors.white,),
                      child: const Text(
                        'Option 3',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 45,
                        ),
                      ),
                    )),
                    Obx(() => TextButton(
                      onPressed: controller.toggleButton4,
                      style: TextButton.styleFrom(
                        backgroundColor:controller.isSelected4.value
                              ? Colors.green
                              : Colors.white,),
                      child: const Text(
                        'Option 4',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 45,
                        ),
                      ),
                    )),
          ],
            ),
        ],
              ),
            ),
          ],
        )
    );
  }
}
