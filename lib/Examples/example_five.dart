import 'package:flutter/material.dart';

class ExampleFive extends StatefulWidget {
  const ExampleFive({Key? key}) : super(key: key);
  static const String id = "/example_five";

  @override
  State<ExampleFive> createState() => _ExampleFiveState();
}
  double   defaultWidth = 100;
class _ExampleFiveState extends State<ExampleFive> {
   bool _isZoomedIn  = false;
  String _buttonTitle = "ZoomIn";
   double width = defaultWidth ;

  var curve = Curves.bounceOut;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Implicit  Animation"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: width,
                  curve:  curve,
                  child: Image.asset(
                    "assets/images/301.jpg",
                  )),
            ],
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _isZoomedIn = !_isZoomedIn;
                _buttonTitle = _isZoomedIn ? "ZoomOut" : "ZoomIn";
                width = _isZoomedIn ? MediaQuery.of(context).size.width : defaultWidth;
                curve =  _isZoomedIn ? Curves.bounceInOut : Curves.bounceIn;
              });
            },
            child: Text(_buttonTitle),
          )
        ],
      ),
    );
  }
}
