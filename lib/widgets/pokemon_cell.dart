import 'package:flutter/material.dart';
import 'package:pokedex/data/api/models/pokemon.dart';
import 'package:pokedex/data/graphql/fetch_pokemons_query.graphql.dart';
import 'package:pokedex/presentation/resources/assets_manager.dart';
import 'package:pokedex/presentation/resources/color_manager.dart';

class PokemonCell extends StatefulWidget {
  PokemonCell(this.pokemon, {super.key});

  late FetchPokemons$Query$Pokemon pokemon;

  @override
  State<PokemonCell> createState() => _PokemonCellState(pokemon);
}

class _PokemonCellState extends State<PokemonCell> {
  _PokemonCellState(this.pokemon);
  late FetchPokemons$Query$Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    var POKEDIR = 'https://img.pokemondb.net/sprites/go/normal/';

    var filtredName = pokemon.name!.replaceAll(RegExp("Mr. Mime"), "mr-mime");
    var name = filtredName.replaceAll(RegExp("Farfetch'd"), "farfetchd");

    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5, top: 5),
      color: Colors.transparent,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.transparent,
            disabledBackgroundColor: Colors.transparent,
            disabledForegroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: () {
          print(['-----Pressed ${pokemon.name}-----', pokemon.image]);
        },
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              gradient: ColorManager
                  .colorByPokemonType[(pokemon.types!.first)?.toLowerCase()],
            ),
            child: Stack(
              children: [
                Positioned(
                  right: 1,
                  bottom: 1,
                  child: Hero(
                      tag: pokemon.name!,
                      child: Image(
                        image: AssetImage(ImageAssets.pokeball),
                        height: 135,
                      )),
                ),
                Positioned(
                  right: -20,
                  bottom: -15,
                  child: Hero(
                    tag: pokemon.name!,
                    child: Image.network(
                      POKEDIR + name.toLowerCase() + '.png',
                      width: 150,
                      height: 150,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Hero(
                      tag: pokemon.name!,
                      child: Text(
                        '#' + pokemon.number!,
                        style: TextStyle(
                            color: Color(0xFF303943).withOpacity(0.2),
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      )),
                ),
                Positioned(
                  left: 10,
                  top: 26,
                  child: Hero(
                      tag: pokemon.name!,
                      child: Text(
                        pokemon.name ?? 'Nan',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                            shadows: [
                              Shadow(
                                offset: Offset(1.5, 1.5),
                                blurRadius: 7.0,
                                color: Colors.black.withOpacity(0.6),
                              )
                            ]),
                      )),
                ),
                Positioned(
                  left: 10,
                  top: 10,
                  child: Hero(
                    tag: pokemon.name!,
                    child: Container(
                      height: 150,
                      width: 45,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: pokemon.types!.length,
                          itemBuilder: (BuildContext context, int idx) {
                            final type = pokemon.types![idx];
                            return Container(
                              margin: EdgeInsets.only(top: 2, bottom: 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  color: Colors.white.withOpacity(0.2)),
                              child: Center(
                                  child: Container(
                                margin: EdgeInsets.only(top: 4, bottom: 4),
                                child: Text(
                                  type!,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              )),
                            );
                          }),
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 0,
                  child: Hero(
                    tag: pokemon.name!,
                    child: IconButton(
                      onPressed: () {
                        print('----- Set as Favorite ------');
                      },
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
