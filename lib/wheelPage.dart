import 'package:flutter/material.dart';

class wheeler extends StatefulWidget {
  const wheeler({super.key});

  @override
  State<wheeler> createState() => _wheelerState();
}

class _wheelerState extends State<wheeler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Wheel Game" ,
        style: TextStyle(
          color: Colors.black 
        ),
        
        ),
        centerTitle: true,
      ),
    );
    
  }
}