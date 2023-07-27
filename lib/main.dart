import 'package:animations/Examples/example_eight.dart';
import 'package:animations/Examples/example_four.dart';
import 'package:animations/Examples/example_nine.dart';
import 'package:animations/Examples/example_one.dart';
import 'package:animations/Examples/example_seven.dart';
import 'package:animations/Examples/example_six.dart';
import 'package:animations/Examples/example_two.dart';
import 'package:flutter/material.dart';

import 'Examples/example_five.dart';
import 'Examples/example_three.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home:HomePage(),
      routes: {
        ExampleOne.id : (context) => const ExampleOne(),
        ExampleTwo.id : (context) => const ExampleTwo(),
        ExampleThree.id : (context) => const ExampleThree(),
        ExampleFour.id : (context) => const ExampleFour(),
        ExampleFive.id : (context) => const ExampleFive(),
        ExampleSix.id : (context) => const ExampleSix(),
        ExampleSeven.id : (context) => const ExampleSeven(),
        ExampleEight.id : (context) => const ExampleEight(),
        ExampleNine.id : (context) => const ExampleNine(),
      },
    );
  }
}


