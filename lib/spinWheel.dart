import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class spinWheel extends StatefulWidget {
  @override
  State<spinWheel> createState() => _spinWheelState();
}

class _spinWheelState extends State<spinWheel> {
  StreamController<int> selected = StreamController<int>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width / 2,
              child: FortuneWheel(
                animateFirst: true,
                selected: selected.stream,
                physics: CircularPanPhysics(
                  duration: Duration(seconds: 2),
                  curve: Curves.decelerate,
                ),
                onFling: () {
                  selected.add(4);
                },
                styleStrategy: UniformStyleStrategy(
                  //borderColor: //(Colors.yellow, Colors.red),
                  color: Colors.red,
                  borderWidth: 5,
                ),
                items: [
                  FortuneItem(
                    child: Text("1000k"),
                  ),
                  FortuneItem(child: Text("10k")),
                  FortuneItem(child: Text("100")),
                  FortuneItem(child: Text("10")),
                  FortuneItem(child: Text("600k")),
                  FortuneItem(child: Text("18k")),
                  FortuneItem(child: Text("300")),
                  FortuneItem(child: Text("178")),
                ],
                onAnimationEnd: () {
                  print("Value : " + "$selected");
                },
              ),
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    selected.add(1);
                  });
                },
                child: TextButton(
                    child: Text('Spin Again'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => spinWheel(),
                          ));
                    }))
          ])),
    );
  }
}
