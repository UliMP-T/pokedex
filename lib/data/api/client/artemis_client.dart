import 'dart:ffi';

import 'package:artemis/artemis.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pokedex/data/graphql/fetch_pokemons_query.dart';

Future<FetchPokemons$Query> getPokemons(ArtemisClient client, quantity) async {
  late final pokemonQuery =
      FetchPokemonsQuery(variables: FetchPokemonsArguments(quantity: quantity));
  final result = await client.execute(pokemonQuery);

  if (result.hasErrors) {
    print([result.errors, '-----SOME ERRORS HERE-----']);
  }

  return result.data!;
}
