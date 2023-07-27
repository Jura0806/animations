import 'package:animations/Examples/example_eight.dart';
import 'package:animations/Examples/example_nine.dart';
import 'package:animations/Examples/example_seven.dart';
import 'package:animations/Examples/example_six.dart';
import 'package:animations/Examples/example_three.dart';
import 'package:animations/Examples/example_two.dart';
import 'package:flutter/material.dart';
import 'dart:math' show pi;

import 'example_five.dart';
import 'example_four.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = "/home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation Courses of Vandad "),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context, ExampleOne.id);
              },
              child: const Text("Example_one"),
            ),
            MaterialButton(
              color: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context, ExampleTwo.id);
              },
              child: const Text("Example_two"),
            ),
            MaterialButton(
              color: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context, ExampleThree.id);
              },
              child: const Text("Example_three"),
            ),
            MaterialButton(
              color: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context, ExampleFour.id);
              },
              child: const Text("Example_Four"),
            ),
            MaterialButton(
              color: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context, ExampleFive.id);
              },
              child: const Text("Example_Five"),
            ),
            MaterialButton(
              color: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context, ExampleSix.id);
              },
              child: const Text("Example_Six"),
            ),
            MaterialButton(
              color: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context, ExampleSeven.id);
              },
              child: const Text("Example_Seven"),
            ),
            MaterialButton(
              color: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context, ExampleEight.id);
              },
              child: const Text("Example_Eight"),
            ),
            MaterialButton(
              color: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context, ExampleNine.id);
              },
              child: const Text("Example_Nine"),
            )
          ],
        ),
      ),
    );
  }
}

class ExampleOne extends StatefulWidget {
  const ExampleOne({Key? key}) : super(key: key);
  static const String id = "/example_1";

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = Tween<double>(begin: 0, end: 2 * pi).animate(_controller);
    _controller.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example_1"),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..rotateY(_animation.value),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      )
                    ]),
              ),
            );
          },
        ),
      ),
    );
  }
}
