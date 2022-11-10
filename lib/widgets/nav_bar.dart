import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:pokedex/presentation/resources/assets_manager.dart';
import 'package:pokedex/ui/favorites.dart';
import 'package:pokedex/ui/home_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  static String routerName = 'NavBar';

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late BuildContext contextInScreen;
  int indexTap = 0;

  final List<Widget> widgetsChildren = [HomePage(), const Favorites()];

  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    contextInScreen = context;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: widgetsChildren[indexTap],
        bottomNavigationBar: SafeArea(
          child: BottomNavigationBar(
            elevation: 0,
            fixedColor: indexTap == 0 ? Colors.amber : Colors.red,
            type: BottomNavigationBarType.shifting,
            onTap: onTapTapped,
            currentIndex: indexTap,
            items: [
              BottomNavigationBarItem(
                label: 'Pokedex',
                activeIcon: SvgPicture.asset(
                  ImageAssets.pikachu,
                  height: 30,
                  color: Colors.amber,
                ),
                icon: SvgPicture.asset(
                  ImageAssets.pikachu,
                  height: 30,
                  color: Colors.grey,
                ),
              ),
              const BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.grey,
                ),
                label: 'Favorites',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
