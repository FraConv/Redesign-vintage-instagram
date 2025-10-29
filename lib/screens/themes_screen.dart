import 'package:flutter/material.dart';

class ThemesScreen extends StatefulWidget {
  const ThemesScreen({super.key});

  @override
  State<ThemesScreen> createState() => _ThemesScreenState();
}

class _ThemesScreenState extends State<ThemesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5EB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF5EB),
        title: Text("Temi", style: TextStyle(fontSize: 30)),
        leading: IconButton(
          onPressed: () => Navigator.pushReplacementNamed(context, "/home"),
          icon: Icon(Icons.chevron_left_rounded, size: 40),
        ),
      ),
      body: Column(),
    );
  }
}
