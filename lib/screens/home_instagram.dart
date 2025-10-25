import 'package:flutter/material.dart';

class HomeInstagram extends StatefulWidget {
  const HomeInstagram({super.key});

  @override
  State<HomeInstagram> createState() => _HomeInstagramState();
}

class _HomeInstagramState extends State<HomeInstagram> {
  // Dati dinamici
  int notifiche = 10;
  int messaggi = 4;

  String formatBadgeCount(int count) {
    if (count > 9) return "9+";
    return count.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5EB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF5EB),
        elevation: 0,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 🔹 Lato sinistro
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFF5EB),
                  elevation: 0,
                  foregroundColor: const Color(0xFF7F5539),
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {},
                child: Row(
                  children: const [
                    Text(
                      "Instagram",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down_rounded, size: 40),
                  ],
                ),
              ),

              // 🔹 Lato destro
              Row(
                children: [
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset("assets/icons/notif.png", width: 27),
                      ),
                      if (notifiche > 0)
                        Positioned(
                          right: 4,
                          top: 1,
                          child: buildBadge(formatBadgeCount(notifiche)),
                        ),
                    ],
                  ),
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset("assets/icons/mess.png", width: 27),
                      ),
                      if (messaggi > 0)
                        Positioned(
                          right: 4,
                          top: 1,
                          child: buildBadge(formatBadgeCount(messaggi)),
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(children: [
            
          ],
        ),
      ),
    );
  }
}

Widget buildBadge(String text) {
  return Container(
    width: 27.5,
    height: 27.5,
    padding: const EdgeInsets.symmetric(horizontal: 5),
    decoration: BoxDecoration(
      color: const Color(0xFFDD7F72),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.black, width: 2),
    ),
    alignment: Alignment.center,
    child: Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    ),
  );
}
