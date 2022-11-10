// To parse this JSON data, do
//
//     final pokemon = pokemonFromJson(jsonString);

import 'dart:convert';

Pokemon pokemonFromJson(String str) => Pokemon.fromJson(json.decode(str));

String pokemonToJson(Pokemon data) => json.encode(data.toJson());

class Pokemon {
  Pokemon({
    this.data,
  });

  Data? data;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.pokemons,
  });

  List<PokemonElement>? pokemons;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pokemons: List<PokemonElement>.from(
            json["pokemons"].map((x) => PokemonElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pokemons": List<dynamic>.from(pokemons!.map((x) => x.toJson())),
      };
}

class PokemonElement {
  PokemonElement({
    this.id,
    this.name,
    this.image,
    this.classification,
    this.types,
    this.maxCp,
    this.maxHp,
  });

  String? id;
  String? name;
  String? image;
  String? classification;
  List<String>? types;
  int? maxCp;
  int? maxHp;

  factory PokemonElement.fromJson(Map<String, dynamic> json) => PokemonElement(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        classification: json["classification"],
        types: List<String>.from(json["types"].map((x) => x)),
        maxCp: json["maxCP"],
        maxHp: json["maxHP"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "classification": classification,
        "types": List<dynamic>.from(types!.map((x) => x)),
        "maxCP": maxCp,
        "maxHP": maxHp,
      };
}
