import 'package:flutter/material.dart';
import 'package:pokedex/ui/favorites.dart';
import 'package:pokedex/ui/home_page.dart';
import 'package:pokedex/ui/signup_screen.dart';
import 'package:pokedex/widgets/nav_bar.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static Map<String, WidgetBuilder> get routes => {
        initialRoute: (context) => const Signup(),
        HomePage.routerName: (_) => HomePage(),
        Favorites.routerName: (_) => Favorites(),
      };
}
