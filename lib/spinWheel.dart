import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class spinWheel extends StatefulWidget {
  const spinWheel({Key? key}) : super(key: key);
  @override
  State<spinWheel> createState() => _spinWheelState();
}

class _spinWheelState extends State<spinWheel> {
  final selected = BehaviorSubject<int>();
  int reward = 0;
  List<int> prize = [100, 1000, 10000, 3000, 5000, 600, 0, 45, 999, 8945, 2500];

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
              children: <Widget>[
            GradientText(
              "Let's Count Your Fortune Money!",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
              colors: [
                Color(0xff0072b1),
                Colors.lightBlueAccent.shade100,
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width / 2,
              child: FortuneWheel(
                animateFirst: false,
                selected: selected,
                indicators: const <FortuneIndicator>[
                  FortuneIndicator(
                      alignment: Alignment.topCenter,
                      child: TriangleIndicator(color: Colors.white))
                ],
                styleStrategy: UniformStyleStrategy(
                  borderColor: Colors.white,
                  color: Color(0xff0072b1),
                  borderWidth: 1,
                ),
                items: [
                  for (int i = 0; i < prize.length; i++) ...<FortuneItem>{
                    FortuneItem(
                      child: Text(prize[i].toString(),
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  }
                ],
                onAnimationEnd: () {
                  setState(() {
                    reward = prize[selected.value];
                  });
                  print(reward);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: GradientText(
                        "Hurray You Just  Won  $reward Points !",
                        colors: [
                          Color(0xff0072b1),
                          Colors.lightBlueAccent.shade100,
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    selected.add(Fortune.randomInt(0, prize.length));
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    color: Color(0xff0072b1),
                  ),
                  height: 40,
                  width: 120,
                  child: const Center(
                    child: Text(
                      'Spin',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Italic',
                        //'Georgia Italic',
                      ),
                    ),
                  ),
                )),

            // Text("Hurray you got $reward"),
          ])),
    );
  }
}
