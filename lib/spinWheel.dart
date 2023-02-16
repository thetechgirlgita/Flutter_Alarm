import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'wheelPage.dart';

class spinWheel extends StatefulWidget {
  const spinWheel({super.key});

  @override
  State<spinWheel> createState() => _spinWheelState();
}

class _spinWheelState extends State<spinWheel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width / 2,
        child: FortuneWheel(animateFirst: false, items: [
          FortuneItem(child: Text("1000k")),
          FortuneItem(child: Text("10k")),
          FortuneItem(child: Text("100")),
        ]),
      ),
    );
  }
}
