import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pokedex/data/api/models/pokemon.dart';

class GetApiServices extends GetxService {
  final HTTP_API_URL = Uri.parse("https://graphql-pokemon2.vercel.app/");

  Future<List<Pokemon>> getPokemons() async {
    var response = await http.get(HTTP_API_URL);

    print([
      // jsonDecode(response.body)['pokemons'],
      jsonDecode(response.body)['pokemon']
    ]);

    return null!;
  }
}
