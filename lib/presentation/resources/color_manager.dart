import 'package:flutter/material.dart';

class ColorManager {
  static Color get tabPokedexColor => const Color(0xFFFFCE4B);
  static Color get tabFavoritesColor => const Color(0xFFFF5B5B);
  static Color get tabIndicatorColor => const Color(0xFF6C79DB);
  static Color get maleIconColor => const Color(0xFF6C79DB);
  static Color get femaleIconColor => const Color(0xFFF0729F);
  static Color get unselectedItemColor => const Color(0xFFD7D7D7);
  static Color get navbarColor => const Color(0xFFF4F4F4);
  static Color get blackTextColor => const Color(0xFF303943);
  static Color get midBlackTextColor => blackTextColor.withOpacity(0.6);
  static Color get searchButtonColor => const Color(0xFF6C79DB);
  static Color get lowStatColor => const Color(0xFFFB6C6C);
  static Color get highStatColor => const Color(0xFF4BC07A);
  static Color get noStatColor => const Color(0xFFF4F5F4);
  static Color get dividerColor => const Color(0xFFF4F5F4);

  static Map<String, LinearGradient> get colorByPokemonType => {
        'normal': const LinearGradient(
          begin: FractionalOffset.bottomLeft,
          end: FractionalOffset.bottomRight,
          stops: [0, 1],
          colors: [
            Color(0xFF9199A3),
            Color(0xFFA3A39E),
          ],
        ),
        'fighting': const LinearGradient(
          begin: FractionalOffset.bottomLeft,
          end: FractionalOffset.bottomRight,
          stops: [0, 1],
          colors: [
            Color(0xFFCF4266),
            Color(0xFFE84247),
          ],
        ),
        'flying': const LinearGradient(
          begin: FractionalOffset.bottomLeft,
          end: FractionalOffset.bottomRight,
          stops: [0, 1],
          colors: [
            Color(0xFF8FA6D9),
            Color(0xFFA6C2F2),
          ],
        ),
        'poison': const LinearGradient(
          begin: FractionalOffset.bottomLeft,
          end: FractionalOffset.bottomRight,
          stops: [0, 1],
          colors: [
            Color(0xFFA863C7),
            Color(0xFFC261D4),
          ],
        ),
        'ground': const LinearGradient(
          begin: FractionalOffset.bottomLeft,
          end: FractionalOffset.bottomRight,
          stops: [0, 1],
          colors: [
            Color(0xFFDB7545),
            Color(0xFFD19463),
          ],
        ),
        'rock': const LinearGradient(
          begin: FractionalOffset.bottomLeft,
          end: FractionalOffset.bottomRight,
          stops: [0, 1],
          colors: [
            Color(0xFFC4B58A),
            Color(0xFFD6CC8F),
          ],
        ),
        'bug': const LinearGradient(
          begin: FractionalOffset.bottomLeft,
          end: FractionalOffset.bottomRight,
          stops: [0, 1],
          colors: [
            Color(0xFFB0C736),
            Color(0xFF91BD2B),
          ],
        ),
        'ghost': const LinearGradient(
          begin: FractionalOffset.bottomLeft,
          end: FractionalOffset.bottomRight,
          stops: [0, 1],
          colors: [
            Color(0xFF526BAB),
            Color(0xFF7873D4),
          ],
        ),
        'steel': const LinearGradient(
          begin: FractionalOffset.bottomLeft,
          end: FractionalOffset.bottomRight,
          stops: [0, 1],
          colors: [
            Color(0xFF52879E),
            Color(0xFF59A6AB),
          ],
        ),
        'fire': const LinearGradient(
          begin: FractionalOffset.bottomLeft,
          end: FractionalOffset.bottomRight,
          stops: [0, 1],
          colors: [
            Color(0xFFFA9C52),
            Color(0xFFFAAD45),
          ],
        ),
        'water': const LinearGradient(
          begin: FractionalOffset.bottomLeft,
          end: FractionalOffset.bottomRight,
          stops: [0, 1],
          colors: [
            Color(0xFF549EDE),
            Color(0xFF69BAE3),
          ],
        ),
        'grass': const LinearGradient(
          begin: FractionalOffset.bottomLeft,
          end: FractionalOffset.bottomRight,
          stops: [0, 1],
          colors: [
            Color(0xFF5EBD52),
            Color(0xFF59C278),
          ],
        ),
        'electric': const LinearGradient(
          begin: FractionalOffset.bottomLeft,
          end: FractionalOffset.bottomRight,
          stops: [0, 1],
          colors: [
            Color(0xFFEDD63D),
            Color(0xFFFAE373),
          ],
        ),
        'psychic': const LinearGradient(
          begin: FractionalOffset.bottomLeft,
          end: FractionalOffset.bottomRight,
          stops: [0, 1],
          colors: [
            Color(0xFFF57070),
            Color(0xFFFF9E91),
          ],
        ),
        'ice': const LinearGradient(
          begin: FractionalOffset.bottomLeft,
          end: FractionalOffset.bottomRight,
          stops: [0, 1],
          colors: [
            Color(0xFF70CCBD),
            Color(0xFF8CDED4),
          ],
        ),
        'dragon': const LinearGradient(
          begin: FractionalOffset.bottomLeft,
          end: FractionalOffset.bottomRight,
          stops: [0, 1],
          colors: [
            Color(0xFF91BD2B),
            Color(0xFFB0C736),
          ],
        ),
        'dark': const LinearGradient(
          begin: FractionalOffset.bottomLeft,
          end: FractionalOffset.bottomRight,
          stops: [0, 1],
          colors: [
            Color(0xFF595761),
            Color(0xFF6E7587),
          ],
        ),
        'fairy': const LinearGradient(
          begin: FractionalOffset.bottomLeft,
          end: FractionalOffset.bottomRight,
          stops: [0, 1],
          colors: [
            Color(0xFFED8CE6),
            Color(0xFFF2A6E8),
          ],
        ),
      };
}
