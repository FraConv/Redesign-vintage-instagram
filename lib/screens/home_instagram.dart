import 'package:flutter/material.dart';
import 'package:intagram/widgets/post.dart';
import 'package:intagram/widgets/navbar.dart';

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
    {
      "profilo": "assets/img/profilo.png",
      "nome": "The_Ghost",
      "miniatura": "assets/img/storia-1.jpg",
    },
    {
      "profilo": "assets/img/profilo-5.jpg",
      "nome": "Angel",
      "miniatura": "assets/img/post-1.jpg",
    },
    {
      "profilo": "assets/img/profilo-6.jpg",
      "nome": "Sliver23",
      "miniatura": "assets/img/post-2.jpg",
    },
    {
      "profilo": "assets/img/profilo-4.jpg",
      "nome": "Luna_Rossa",
      "miniatura": "assets/img/post-3.jpg",
    },
    {
      "profilo": "assets/img/profilo-8.jpg",
      "nome": "Dany_Bro",
      "miniatura": "assets/img/storia-2.jpg",
    },
    {
      "profilo": "assets/img/profilo-2.jpg",
      "nome": "Marti05",
      "miniatura": "assets/img/storia-3.jpg",
    },
    {
      "profilo": "assets/img/profilo-3.jpg",
      "nome": "Gabry_Blood",
      "miniatura": "assets/img/storia-1.jpg",
    },
    {
      "profilo": "assets/img/profilo-7.jpg",
      "nome": "Sirius",
      "miniatura": "assets/img/post-1.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //header
      backgroundColor: const Color(0xFFFFF5EB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF5EB),
        scrolledUnderElevation: 0,
        elevation: 0,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Image.asset(
                  "assets/img/Logo.png",
                  width: 140,
                  color: Color(0xFF7F5539),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 79),
                child: IconButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, "/themes"),
                  icon: Icon(
                    Icons.expand_more_rounded,
                    size: 40,
                    color: Color(0xFF7F5539),
                  ),
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
              height: 260,
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
                              width: 150,
                              height: 190,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 3,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  item["miniatura"],
                                  width: double
                                      .infinity, // riempie tutta la larghezza del container
                                  height: double
                                      .infinity, // e anche tutta l’altezza
                                  fit: BoxFit
                                      .cover, // riempie completamente lo spazio
                                ),
                              ),
                            ),
                            Container(
                              width: 150,
                              height: 65,
                              decoration: BoxDecoration(
                                color: Color(0xFFCAB9A8),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(50),
                                  bottomRight: Radius.circular(50),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              width: 150,
                              height: 65,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFEBD8),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(50),
                                  bottomRight: Radius.circular(50),
                                ),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 3,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 36.5,
                              top: 78,
                              child: Container(
                                margin: EdgeInsets.only(bottom: 40),
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Color(0xFFB75446),
                                  borderRadius: BorderRadius.circular(250),
                                ),
                              ),
                            ),

                            Positioned(
                              left: 33,
                              bottom: 40,

                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 3.5,
                                      ),
                                    ),
                                    child: Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          250,
                                        ),
                                        border: Border.all(
                                          color: Color(0xFFDD7F72),
                                          width: 4,
                                        ),
                                      ),
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: AssetImage(
                                          item["profilo"],
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (isUserStory)
                                    Positioned(
                                      right: 0,
                                      bottom: 0,
                                      child: Container(
                                        width: 26,
                                        height: 26,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFDD7F72),
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 2.5,
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.black,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          isUserStory ? "La tua storia" : item["nome"],
                          style: const TextStyle(
                            color: Color(0xFF7F5539),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
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
                Padding(padding: EdgeInsets.only(bottom: 10), child: Post()),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const NavBar(selectedIndex: 0),
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
