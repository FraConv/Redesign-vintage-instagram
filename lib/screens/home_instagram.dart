import 'package:flutter/material.dart';

class HomeInstagram extends StatefulWidget {
  const HomeInstagram({super.key});

  @override
  State<HomeInstagram> createState() => _HomeInstagramState();
}

class _HomeInstagramState extends State<HomeInstagram> {
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

  final List<Map<String, dynamic>> post = [
    {
      "icona": "assets/img/profilo-9.jpg",
      "nome": "Dark",
      "contenuto": "assets/img/post-1.jpg",
      "descrizione": "Il mio primo post su Instagram Vintage",
      "audio": "♫ audio originale",
      "isLike": false,
      "likeCount": 42,
      "isComments": false,
      "commentsCount": 2,
      "isShare": false,
      "shareCount": 1,
      "isFavorite": false,
      "favoriteCount": 3,
      "isStory": false,
      "isFollow": false,
    },
    {
      "icona": "assets/img/profilo-2.jpg",
      "nome": "Marti05",
      "contenuto": "assets/img/post-2.jpg",
      "descrizione": "Il mio piccolo angolo di paradiso",
      "audio": "♫ hourglass of Est",
      "isLike": false,
      "likeCount": 12,
      "isComments": false,
      "commentsCount": 0,
      "isShare": false,
      "shareCount": 0,
      "isFavorite": false,
      "favoriteCount": 1,
      "isStory": true,
      "isFollow": true,
    },
    {
      "icona": "assets/img/profilo-3.jpg",
      "nome": "Gabry_Blood",
      "contenuto": "assets/img/post-3.jpg",
      "descrizione": "Questo paesaggio è troppo bello<3",
      "audio": "♫ Relax chill song",
      "isLike": false,
      "likeCount": 100,
      "isComments": false,
      "commentsCount": 19,
      "isShare": false,
      "shareCount": 30,
      "isFavorite": false,
      "favoriteCount": 26,
      "isStory": true,
      "isFollow": true,
    },
  ];

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

      // CORPO
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

            // post
            Column(
              children: List.generate(post.length, (index) {
                final item = post[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 530,
                      margin: const EdgeInsets.only(top: 20),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          // --- IMMAGINE ---
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFCAB9A8),
                              borderRadius: BorderRadius.circular(90),
                            ),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(90),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 3,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(90),
                                child: Image.asset(
                                  item["contenuto"],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                          ),

                          // --- HEADER ---
                          Positioned(
                            top: 10,
                            left: 10,
                            right: 10,
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.white,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      color: item["isStory"]
                                          ? Colors.black
                                          : Colors.transparent,
                                      width: item["isStory"] ? 2 : 0,
                                    ),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                        color: item["isStory"]
                                            ? Color(0xFFDD7F72)
                                            : Colors.transparent,
                                        width: item["isStory"] ? 2 : 0,
                                      ),
                                    ),
                                    child: ClipOval(
                                      child: Image.asset(
                                        item["icona"],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              title: Text(
                                item["nome"],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      offset: Offset(1.5, 1.5),
                                      blurRadius: 3.0,
                                      color: Colors.black26,
                                    ),
                                  ],
                                ),
                              ),
                              subtitle: Text(
                                item["audio"],
                                style: const TextStyle(
                                  color: Colors.black,
                                  shadows: [
                                    Shadow(
                                      offset: Offset(1, 1),
                                      blurRadius: 2.0,
                                      color: Colors.black26,
                                    ),
                                  ],
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    height: 35,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          blurRadius: 6,
                                          offset: const Offset(2, 2),
                                        ),
                                      ],
                                      color: const Color(0xFFDBB99C),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Container(
                                      height: 30,
                                      margin: const EdgeInsets.only(bottom: 4),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            item["isFollow"] =
                                                !item["isFollow"];
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(
                                            0xFFB08968,
                                          ),
                                          elevation: 0,
                                          minimumSize: const Size(75, 25),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 5,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              50,
                                            ),
                                            side: const BorderSide(
                                              color: Colors.black,
                                              width: 3,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          item["isFollow"]
                                              ? "Segui già"
                                              : "Segui",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Image.asset("assets/icons/more-icon.png"),
                                ],
                              ),
                              tileColor: Colors.white.withOpacity(0.4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),

                          // actions posts
                          Positioned(
                            top: 150,
                            right: 15,
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (post[index]["isLike"] == true) {
                                        post[index]["isLike"] = false;
                                        post[index]["likeCount"]--;
                                      } else {
                                        post[index]["isLike"] = true;
                                        post[index]["likeCount"]++;
                                      }
                                    });
                                  },
                                  icon: Image.asset(
                                    post[index]["isLike"]
                                        ? "assets/icons/like-on.png"
                                        : "assets/icons/like.png",
                                    width: 30,
                                  ),
                                ),
                                Text(
                                  "${post[index]["likeCount"]}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        offset: Offset(1.5, 1.5),
                                        blurRadius: 3.0,
                                        color: Colors.black54,
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (post[index]["isComments"] == true) {
                                        post[index]["isComments"] = false;
                                        post[index]["commentsCount"]--;
                                      } else {
                                        post[index]["isComments"] = true;
                                        post[index]["commentsCount"]++;
                                      }
                                    });
                                  },
                                  icon: Image.asset(
                                    post[index]["isComments"]
                                        ? "assets/icons/comm-on.png"
                                        : "assets/icons/comm.png",
                                    width: 30,
                                  ),
                                ),
                                Text(
                                  "${post[index]["commentsCount"]}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        offset: Offset(1.5, 1.5),
                                        blurRadius: 3.0,
                                        color: Colors.black54,
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (post[index]["isShare"] == true) {
                                        post[index]["isShare"] = false;
                                        post[index]["shareCount"]--;
                                      } else {
                                        post[index]["isShare"] = true;
                                        post[index]["shareCount"]++;
                                      }
                                    });
                                  },
                                  icon: Image.asset(
                                    post[index]["isShare"]
                                        ? "assets/icons/mess-on.png"
                                        : "assets/icons/mess.png",
                                    width: 30,
                                  ),
                                ),
                                Text(
                                  "${post[index]["shareCount"]}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        offset: Offset(1.5, 1.5),
                                        blurRadius: 3.0,
                                        color: Colors.black54,
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (post[index]["isFavorite"] == true) {
                                        post[index]["isFavorite"] = false;
                                        post[index]["favoriteCount"]--;
                                      } else {
                                        post[index]["isFavorite"] = true;
                                        post[index]["favoriteCount"]++;
                                      }
                                    });
                                  },
                                  icon: Image.asset(
                                    post[index]["isFavorite"]
                                        ? "assets/icons/pref-on.png"
                                        : "assets/icons/pref.png",
                                    width: 30,
                                  ),
                                ),
                                Text(
                                  "${post[index]["favoriteCount"]}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        offset: Offset(1.5, 1.5),
                                        blurRadius: 3.0,
                                        color: Colors.black54,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item["nome"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF7F5539),
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            item["descrizione"],
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF9C6644),
                              fontSize: 15,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsGeometry.symmetric(vertical: 15),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
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
