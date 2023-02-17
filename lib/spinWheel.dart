import 'dart:async';
import 'dart:math';
import 'package:rxdart/rxdart.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class spinWheel extends StatefulWidget {
  @override
  State<spinWheel> createState() => _spinWheelState();
}

class _spinWheelState extends State<spinWheel> {
  final selected = BehaviorSubject<int>();
  //StreamController<int> selected = StreamController<int>();
  int reward = 0;
  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

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
                //animateFirst: true,
                physics: CircularPanPhysics(
                  duration: Duration(seconds: 2),
                  curve: Curves.decelerate,
                ),
                onFling: () {
                  selected.add(1);
                },
                selected: selected,
                indicators: <FortuneIndicator>[
                  FortuneIndicator(
                      alignment: Alignment.centerRight,
                      child: TriangleIndicator(color: Colors.yellow))
                ],
                styleStrategy: UniformStyleStrategy(
                  borderColor: Colors.black26,
                  color: Colors.pink.shade100,
                  borderWidth: 1,
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
                  setState(() {});
                },
              ),
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    selected.add(Fortune.randomInt(0, 7));
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    color: Colors.pink.shade100,
                    //  color: Colors.pink.shade100,
                  ),
                  height: 40,
                  width: 120,
                  child: Center(
                    child: Text('Spin Again'),
                  ),
                  //color: Colors.pink.shade100,
                )),
            Text("Hurray you got $selected"),
          ])),
    );
  }
}
