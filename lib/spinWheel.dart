import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'wheelPage.dart';

class spinWheel extends StatefulWidget {
  const spinWheel({super.key});

  @override
  State<spinWheel> createState() => _spinWheelState();
}

class _spinWheelState extends State<spinWheel> {
  int selected = 0;

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
                //  selected: selected,
                animateFirst: true,
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
              ),
            ),
            GestureDetector(
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
