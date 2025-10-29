import 'package:flutter/material.dart';
import 'package:intagram/screens/add_screen.dart';
import 'package:intagram/screens/home_instagram.dart';
import 'package:intagram/screens/profile_screen.dart';
import 'package:intagram/screens/reels_screen.dart';
import 'package:intagram/screens/search_screen.dart';
import 'package:intagram/screens/themes_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Vintage',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomeInstagram(),
      routes: {
        "/home": (context) => const HomeInstagram(),
        "/profile": (context) => const ProfileScreen(),
        "/add": (context) => const AddScreen(),
        "/search": (context) => const SearchScreen(),
        "/reels": (context) => const ReelsScreen(),
        "/themes": (context) => const ThemesScreen(),
      },
    );
  }
}
