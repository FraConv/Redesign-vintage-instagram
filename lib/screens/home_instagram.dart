import 'package:flutter/material.dart';
import 'package:intagram/widgets/post.dart';

class HomeInstagram extends StatefulWidget {
  const HomeInstagram({super.key});

  @override
  State<HomeInstagram> createState() => _HomeInstagramState();
}

class _HomeInstagramState extends State<HomeInstagram> {
  //dati dinamici
  int notifiche = 10;
  int messaggi = 4;

  String formatBadgeCount(int count) {
    if (count > 9) return "9+";
    return count.toString();
  }

  List<Map<String, dynamic>> storie = [
    {"profilo": "assets/img/profilo.png", "nome": "The_Ghost"},
    {"profilo": "assets/img/profilo-5.jpg", "nome": "Angel"},
    {"profilo": "assets/img/profilo-6.jpg", "nome": "Sliver23"},
    {"profilo": "assets/img/profilo-4.jpg", "nome": "Luna_Rossa"},
    {"profilo": "assets/img/profilo-8.jpg", "nome": "Dany_Bro"},
    {"profilo": "assets/img/profilo-2.jpg", "nome": "Marti05"},
    {"profilo": "assets/img/profilo-3.jpg", "nome": "Gabry_Blood"},
    {"profilo": "assets/img/profilo-7.jpg", "nome": "Sirius"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //header
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFF5EB),
                  elevation: 0,
                  foregroundColor: const Color(0xFF7F5539),
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {},
                child: const Row(
                  children: [
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

      // corpo
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: Column(
          children: [
            // storie
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(10),
                itemCount: storie.length,
                itemBuilder: (context, index) {
                  final item = storie[index];
                  final bool isUserStory = index == 0;
                  return Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                color: const Color(0xFFB75446),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 7),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 3,
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      color: const Color(0xFFDD7F72),
                                      width: 4,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.asset(
                                      item["profilo"],
                                      width: 65,
                                      height: 65,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // icona + prima storia
                            if (isUserStory)
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: Container(
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFB75446),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 2,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        Text(
                          isUserStory ? "La tua storia" : item["nome"],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Column(
              children: [
                Padding(padding: EdgeInsets.only(bottom: 70), child: Post()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// badge
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
