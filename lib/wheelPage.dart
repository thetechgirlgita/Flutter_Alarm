import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class wheeler extends StatefulWidget {
  const wheeler({super.key});

  @override
  State<wheeler> createState() => _wheelerState();
}

class _wheelerState extends State<wheeler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent.shade100,
        title: Text("Fortune Wheel Game" ,

        style: TextStyle(
          color: Colors.black ,
          fontWeight: FontWeight.bold,
        ),
        
        ),
        centerTitle: true,
      ),
      body:
      Container(
         color: Colors.pinkAccent.shade100,
         // ignore: prefer_const_constructors
         child: AlertDialog(
          title: Center( child: Text("Spin a Wheel")),
          content: Text("Let's see how much can you earn by luck."),
          
          actions: [
          
        

         ]),

      )
    );
    
  }
}