import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intagram/widgets/theme_provider.dart';

class ThemesScreen extends StatefulWidget {
  const ThemesScreen({super.key});

  @override
  State<ThemesScreen> createState() => _ThemesScreenState();
}

final List<Map<String, dynamic>> basicSettings = [
  {
    "title": "Tema scuro",
    "subtitle": "Attiva il tema scuro.",
    "isActive": false,
  },
  {
    "title": "Temi automatici",
    "subtitle":
        "Attiva il cambio automatico del tema in occasione delle festività.",
    "isActive": true,
  },
  {
    "title": "Modalita mancino",
    "subtitle":
        "Attiva il cambio di posizione dei pulsanti (da destra a sinistra).",
    "isActive": false,
  },
];

final List<Map<String, dynamic>> customThemes = [
  {"img": "assets/img/vintage.png", "nome": "Standard"},
  {"img": "assets/img/halloween.png", "nome": "Halloween"},
  {"img": "assets/img/inverno.png", "nome": "Natalizio"},
  {"img": "assets/img/pasqua.png", "nome": "Pasqua"},
  {"img": "assets/img/Valentino.png", "nome": "Valentino"},
  {"img": "assets/img/Happy.png", "nome": "Happy"},
];

class _ThemesScreenState extends State<ThemesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5EB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF5EB),
        scrolledUnderElevation: 0,
        elevation: 0,
        title: Text(
          "Temi",
          style: TextStyle(
            fontSize: 35,
            color: Color(0xFF7F5539),
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pushReplacementNamed(context, "/home"),
          icon: Icon(
            Icons.chevron_left_rounded,
            size: 45,
            color: Color(0xFF7F5539),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
              alignment: Alignment.centerLeft,
              child: Text(
                "Opzioni base",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Color(0xFF7F5539),
                ),
              ),
            ),
            Column(
              children: List.generate(basicSettings.length, (index) {
                final item = basicSettings[index];
                return ListTile(
                  title: Text(
                    item["title"],
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xFF7F5539),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    item["subtitle"],
                    style: TextStyle(fontSize: 15, color: Color(0xFFA26F4E)),
                  ),
                  // switch
                  trailing: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFFDBB99C),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 7),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 3),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            item["isActive"] = !item["isActive"];
                          });

                          if (item["title"] == "Modalita mancino") {
                            context.read<SettingsProvider>().toggleLeftHanded(
                              item["isActive"],
                            );
                          }
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          width: 60,
                          height: 34,
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFF5EB),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Color(0xFFB08968),
                              width: 3,
                            ),
                          ),

                          child: AnimatedAlign(
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                            alignment: item["isActive"]
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: AnimatedContainer(
                              key: ValueKey(
                                item["isActive"],
                              ), // forza ricostruzione e animazione
                              duration: Duration(milliseconds: 400),
                              width: item["isActive"]
                                  ? 28
                                  : 17, // animazione dimensioni
                              height: item["isActive"] ? 28 : 20,
                              decoration: BoxDecoration(
                                color: item["isActive"]
                                    ? Color(0xFFFF8100)
                                    : Color(0xFFB08968),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 3,
                                ),
                                boxShadow: item["isActive"]
                                    ? [
                                        BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0, 2),
                                          blurRadius: 4,
                                        ),
                                      ]
                                    : [],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            Container(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                "Temi personalizzati",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Color(0xFF7F5539),
                ),
              ),
            ),
            Container(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              alignment: Alignment.centerRight,
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  color: const Color(0xFFDBB99C),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Container(
                  height: 30,
                  margin: const EdgeInsets.only(bottom: 7),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {});
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
                        side: const BorderSide(color: Colors.black, width: 3),
                      ),
                    ),
                    child: Text(
                      "Scarica temi",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: GridView.builder(
                  itemCount: customThemes.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // due colonne
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1, // regola forma
                  ),
                  itemBuilder: (context, index) {
                    final theme = customThemes[index];
                    return GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Hai selezionato il tema: ${theme["nome"]}",
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF7F5539),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            backgroundColor: const Color(0xFFFFEBD8),
                            shape: Border.all(color: Colors.black, width: 3),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFCAB9A8),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF5EB),
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              width: 3,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 2),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 6,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    theme["img"],
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                  ),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFFFEBD8),
                                    border: Border(
                                      top: BorderSide(
                                        color: Colors.black,
                                        width: 3,
                                      ),
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(40),
                                      bottomRight: Radius.circular(40),
                                    ),
                                  ),
                                  child: Text(
                                    theme["nome"],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xFF7F5539),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
