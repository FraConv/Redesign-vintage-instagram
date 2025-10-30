import 'package:flutter/material.dart';
import 'package:intagram/widgets/navbar.dart';
import 'package:provider/provider.dart';
import 'package:intagram/widgets/theme_provider.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<SettingsProvider>().isDark;
    return Scaffold(
      backgroundColor: isDark ? Color(0xFF5C554D) : Color(0xFFFFF5EB),
      appBar: AppBar(
        title: Text(
          "Aggiungi",
          style: TextStyle(
            color: isDark ? Color(0xFFF0E5D9) : Color(0xFF7F5539),
          ),
        ),
        backgroundColor: isDark ? Color(0xFF5C554D) : Color(0xFFFFF5EB),
      ),
      body: Column(),
      bottomNavigationBar: const NavBar(selectedIndex: 2),
    );
  }
}
