import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intagram/screens/add_screen.dart';
import 'package:intagram/screens/home_instagram.dart';
import 'package:intagram/screens/profile_screen.dart';
import 'package:intagram/screens/reels_screen.dart';
import 'package:intagram/screens/search_screen.dart';
import 'package:intagram/screens/themes_screen.dart';
import 'package:intagram/widgets/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => SettingsProvider(), // istanza del provider
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
