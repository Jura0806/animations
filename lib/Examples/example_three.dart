import 'dart:math' show pi;
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class ExampleThree extends StatefulWidget {
  const ExampleThree({Key? key}) : super(key: key);
  static const String id = "/example_three";

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree>
    with TickerProviderStateMixin {
  static const widthAndHeight = 100.0;

  late AnimationController _xController;
  late AnimationController _yController;
  late AnimationController _zController;
  late Tween<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _xController =
        AnimationController(vsync: this, duration: const Duration(seconds: 20));
    _yController =
        AnimationController(vsync: this, duration: const Duration(seconds: 30));
    _zController =
        AnimationController(vsync: this, duration: const Duration(seconds: 40));

    _animation = Tween<double>(
      begin: 0,
      end: 2 * pi,
    );
  }

  @override
  void dispose() {
    _xController.dispose();
    _yController.dispose();
    _zController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _xController
      ..reset()
      ..repeat();

    _yController
      ..reset()
      ..repeat();

    _zController
      ..reset()
      ..repeat();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Example_three"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: widthAndHeight,
              width: double.infinity,
            ),
            AnimatedBuilder(
              animation: Listenable.merge([
                _xController,
                _yController,
                _zController,
              ]),
              builder: (context, child) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..rotateX(_animation.evaluate(_xController))
                    ..rotateY(_animation.evaluate(_yController))
                    ..rotateZ(_animation.evaluate(_zController)),
                  child: Stack(
                    children: [
                      //back
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..translate(Vector3(0, 0, -widthAndHeight)),
                        child: Container(
                          color: Colors.purple,
                          height: widthAndHeight,
                          width: widthAndHeight,
                        ),
                      ),
                      //right side
                      Transform(
                        alignment: Alignment.centerRight,
                        transform: Matrix4.identity()
                          ..rotateY(-pi/2),
                        child: Container(
                          color: Colors.blue,
                          height: widthAndHeight,
                          width: widthAndHeight,
                        ),
                      ),
                      //left side
                      Transform(
                        alignment: Alignment.centerLeft,
                        transform: Matrix4.identity()
                          ..rotateY(pi/2),
                        child: Container(
                          color: Colors.red,
                          height: widthAndHeight,
                          width: widthAndHeight,
                        ),
                      ),
                      //top side
                      Transform(
                        alignment: Alignment.topCenter,
                        transform: Matrix4.identity()
                          ..rotateX(-pi/2),
                        child: Container(
                          color: Colors.orange,
                          height: widthAndHeight,
                          width: widthAndHeight,
                        ),
                      ),
                      //bottom side
                      Transform(
                        alignment: Alignment.bottomCenter,
                        transform: Matrix4.identity()
                          ..rotateX(pi/2),
                        child: Container(
                          color: Colors.brown,
                          height: widthAndHeight,
                          width: widthAndHeight,
                        ),
                      ),
                      // front
                      Container(
                        height: widthAndHeight,
                        width: widthAndHeight,
                        color: Colors.green,
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
