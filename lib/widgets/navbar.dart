import 'package:flutter/material.dart';

class NavItem {
  final String icon;
  final String activeIcon;
  final String route;

  NavItem(this.icon, this.activeIcon, this.route);
}

class NavBar extends StatelessWidget {
  final int selectedIndex;
  const NavBar({super.key, required this.selectedIndex});

  void _onItemTapped(BuildContext context, int index, List<NavItem> items) {
    if (index == selectedIndex) return;
    Navigator.pushReplacementNamed(context, items[index].route);
  }

  @override
  Widget build(BuildContext context) {
    // icon, activeicon e route
    final items = [
      NavItem("assets/icons/home.png", "assets/icons/home-on.png", "/home"),
      NavItem("assets/icons/lente.png", "assets/icons/lente-on.png", "/search"),
      NavItem("assets/icons/add.png", "assets/icons/add-on.png", "/add"),
      NavItem("assets/icons/reel.png", "assets/icons/reel-on.png", "/reels"),
      NavItem("assets/img/profilo.png", "assets/img/profilo.png", "/profile"),
    ];

    // navbar
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 20, right: 10, left: 10),
          decoration: BoxDecoration(
            color: Color(0xFFCAB9A8),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(75),
              topRight: Radius.circular(75),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.only(bottom: 8, right: 2, left: 2),
            height: 55,
            decoration: BoxDecoration(
              color: const Color(0xFFFFEBD8),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(55),
                topRight: Radius.circular(55),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              border: Border.all(color: Colors.black, width: 3),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(items.length, (index) {
                final item = items[index];
                final bool isAdd = index == 2;
                final bool isProfile = index == 4;

                if (isAdd) return const SizedBox(width: 60);

                return GestureDetector(
                  onTap: () => _onItemTapped(context, index, items),
                  child: isProfile
                      ? Container(
                          padding: EdgeInsets.all(3.2),
                          decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? Color(0xFFFF8100)
                                : Color(0xFFB08968),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 3),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              selectedIndex == index
                                  ? item.activeIcon
                                  : item.icon,
                              width: 28,
                              height: 28,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Image.asset(
                          selectedIndex == index ? item.activeIcon : item.icon,
                          width: 35,
                          height: 35,
                        ),
                );
              }),
            ),
          ),
        ),
        // pulsante add sovrapposto
        Positioned(
          bottom: 43,
          child: GestureDetector(
            onTap: () => _onItemTapped(context, 2, items),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xFFCAB9A8),
              ),
              child: Container(
                margin: EdgeInsets.only(bottom: 7),
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFEBD8),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 3),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    selectedIndex == 2 ? items[2].activeIcon : items[2].icon,

                    width: 40,
                    height: 40,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
