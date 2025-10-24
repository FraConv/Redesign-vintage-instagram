import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeInstagram extends StatefulWidget {
  const HomeInstagram({super.key});

  @override
  State<HomeInstagram> createState() => _HomeInstagramState();
}

class _HomeInstagramState extends State<HomeInstagram> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF5EB),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFF5EB),
        foregroundColor: Color(0xFF7F5539),
        title: Text("Instagram", style: TextStyle(fontSize: 34)),
      ),
    );
  }
}
