import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:slidebar_animation/spinWheel.dart';

class wheeler extends StatefulWidget {
  const wheeler({super.key});

  @override
  State<wheeler> createState() => _wheelerState();
}

class _wheelerState extends State<wheeler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        /* appBar: AppBar(
        backgroundColor: Colors.pinkAccent.shade100,
        title: Text("Fortune Wheel Game" ,

        style: TextStyle(
          color: Colors.black ,
          fontWeight: FontWeight.bold,
        ),
        
        ),
        centerTitle: true,
      ),*/
        body: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      // color: Colors.pinkAccent.shade100,
      // ignore: prefer_const_constructors
      child: AlertDialog(
          backgroundColor: Color(0xff0072b1),
          title: Text("Surprise", style: TextStyle(color: Colors.white)),
          content: Text("Click on 'Open Surprise' to get your prize.",
              style: TextStyle(color: Colors.white)),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => spinWheel(),
                    ));
              },
              child: Container(
                  height: 35,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      "Open Surprise",
                      style: TextStyle(color: Colors.blue),
                    ),
                  )),
            )
          ]),
    ));
  }
}
