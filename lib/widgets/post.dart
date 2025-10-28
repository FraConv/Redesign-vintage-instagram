import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
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
      "isShare": false,
      "shareCount": 1,
      "isFavorite": false,
      "favoriteCount": 3,
      "isStory": false,
      "isFollow": false,
      "comments": [
        {
          "profilo": "assets/img/profilo-2.jpg",
          "user": "Vale",
          "commento": "ottimo post",
          "isFavoriteComments": false,
        },
        {
          "profilo": "assets/img/profilo-5.jpg",
          "user": "Diamante_blu",
          "commento": "Amo questo paesaggio",
          "isFavoriteComments": false,
        },
      ],
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
      "isShare": false,
      "shareCount": 0,
      "isFavorite": false,
      "favoriteCount": 1,
      "isStory": true,
      "isFollow": true,
      "comments": [
        {
          "profilo": "assets/img/profilo-4.jpg",
          "user": "Love.you",
          "commento": "Sembra un dipinto",
          "isFavoriteComments": false,
        },
      ],
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
      "isShare": false,
      "shareCount": 30,
      "isFavorite": false,
      "favoriteCount": 26,
      "isStory": true,
      "isFollow": true,
      "comments": [],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  // -immagine
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFCAB9A8),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        border: Border.all(color: Colors.black, width: 3),
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
                                    item["isFollow"] = !item["isFollow"];
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFB08968),
                                  elevation: 0,
                                  minimumSize: const Size(75, 25),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    side: const BorderSide(
                                      color: Colors.black,
                                      width: 3,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  item["isFollow"] ? "Segui già" : "Segui",
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
                            //bottom sheet
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: const Color(0xFFFFEBD8),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(80),
                                ),
                                side: BorderSide(color: Colors.black, width: 3),
                              ),
                              builder: (context) {
                                return DraggableScrollableSheet(
                                  expand: false,
                                  initialChildSize: 0.7,
                                  minChildSize: 0.4,
                                  maxChildSize: 0.95,
                                  builder: (context, scrollController) {
                                    return StatefulBuilder(
                                      builder: (context, setModalState) {
                                        return Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Column(
                                            children: [
                                              Container(
                                                width: 40,
                                                height: 4,
                                                margin: const EdgeInsets.only(
                                                  bottom: 10,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: const Color(
                                                    0xFFB08968,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "${item["comments"].length} commenti",
                                                style: const TextStyle(
                                                  color: Color(0xFF7F5539),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Expanded(
                                                child: ListView.builder(
                                                  controller: scrollController,
                                                  itemCount:
                                                      item["comments"].length,
                                                  itemBuilder: (context, i) {
                                                    final comment =
                                                        item["comments"][i];
                                                    return ListTile(
                                                      leading: CircleAvatar(
                                                        backgroundImage:
                                                            AssetImage(
                                                              comment["profilo"],
                                                            ),
                                                      ),
                                                      title: Text(
                                                        comment["user"],
                                                      ),
                                                      subtitle: Text(
                                                        comment["commento"],
                                                      ),
                                                      trailing: IconButton(
                                                        onPressed: () {
                                                          setModalState(() {
                                                            comment["isFavoriteComments"] =
                                                                !comment["isFavoriteComments"];
                                                          });
                                                        },
                                                        icon: Image.asset(
                                                          comment["isFavoriteComments"]
                                                              ? "assets/icons/like-on.png"
                                                              : "assets/icons/like.png",
                                                          width: 15,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              TextField(
                                                decoration: InputDecoration(
                                                  hintText:
                                                      'Scrivi un commento...',
                                                  hintStyle: const TextStyle(
                                                    color: Color(0xFF7F5539),
                                                  ),
                                                  filled: true,
                                                  fillColor: const Color(
                                                    0xFFFFF5EB,
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          30,
                                                        ),
                                                  ),
                                                  contentPadding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 16,
                                                      ),
                                                  suffixIcon: IconButton(
                                                    icon: const Icon(
                                                      Icons.send,
                                                      color: Color(0xFF7F5539),
                                                    ),
                                                    onPressed: () {
                                                      // aggiungi un commento fittizio
                                                      setModalState(() {
                                                        item["comments"].add({
                                                          "profilo":
                                                              "assets/img/profilo.png",
                                                          "user": "Tu",
                                                          "commento":
                                                              "Nuovo commento",
                                                          "isFavoriteComments":
                                                              false,
                                                        });
                                                      });
                                                      setState(() {});
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            );
                          },
                          icon: Image.asset("assets/icons/comm.png", width: 30),
                        ),
                        Text(
                          "${item["comments"].length}",
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
                  Padding(padding: EdgeInsetsGeometry.symmetric(vertical: 15)),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
