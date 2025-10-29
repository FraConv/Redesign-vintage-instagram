import 'package:flutter/material.dart';
import 'package:intagram/widgets/navbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5EB),
      appBar: AppBar(
        title: Text("profilo"),
        backgroundColor: const Color(0xFFFFF5EB),
      ),
      body: Column(),
      bottomNavigationBar: const NavBar(selectedIndex: 4),
    );
  }
}
