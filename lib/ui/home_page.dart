import 'package:artemis/artemis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';

import 'package:gql_dio_link/gql_dio_link.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pokedex/app/pokedex.dart';
import 'package:pokedex/data/api/client/artemis_client.dart';
import 'package:pokedex/data/api/client/dio_configuration.dart';
import 'package:pokedex/data/api/controllers/getx_controller.dart';
import 'package:pokedex/data/api/models/pokemon.dart';
import 'package:pokedex/data/graphql/fetch_pokemons_query.graphql.dart';
import 'package:pokedex/presentation/resources/assets_manager.dart';
import 'package:pokedex/widgets/pokemon_cell.dart';

int updateAppState(int integer) {
  return Pokedex.instance.appState = integer;
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  static String routerName = 'Main Home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  // State<HomePage> createState() => _HomePageState();
// }
  final controller = Get.put(GetXController());

// class _HomePageState extends State<HomePage> {
  int _indexSelected = 0;
  late ScrollController scrollController;

  _setScrollToLimit() {
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
  }

  _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      setState(() {
        controller.increment();

        scrollController.animateTo(
            scrollController.offset + scrollController.position.maxScrollExtent,
            curve: Curves.linear,
            duration: Duration(milliseconds: 500));
        print(scrollController.offset);
      });
    }
    // if (scrollController.offset <= scrollController.position.minScrollExtent &&
    //     !scrollController.position.outOfRange) {
    //   setState(() {
    //     _setScrollToLimit();
    //   });
    // }
  }

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var dio = Dio();
    dio.options.baseUrl = 'https://graphql-pokemon2.vercel.app/';
    // final ArtemisClient artemisClient;
    final artemisClient = ArtemisClient('https://graphql-pokemon2.vercel.app/');
    final link = Link.from([DioLink("/graphql", client: dio)]);

    // final artemisClient = ArtemisClient.fromLink(link);

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    // TODO: implement build
    return GetBuilder<GetXController>(
      builder: (_) => FutureBuilder(
          future: getPokemons(artemisClient, controller.ammount),
          builder: (BuildContext context,
              AsyncSnapshot<FetchPokemons$Query> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                height: screenHeight,
                child: Stack(
                  children: [
                    Positioned(
                      top: -50,
                      right: -80,
                      child: Image(
                        image: AssetImage(ImageAssets.pokeball),
                        height: 250,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      top: 155,
                      left: 0,
                      child: Container(
                          height: screenHeight - 250,
                          width: screenWidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                          ),
                          child: GridView.count(
                            controller: scrollController,
                            crossAxisSpacing: 0,
                            childAspectRatio: 1.3,
                            crossAxisCount: 2,
                            children: List.generate(
                                snapshot.data!.pokemons!.length, (index) {
                              final pokemon = snapshot.data!.pokemons![index];
                              return PokemonCell(pokemon!);
                            }),
                            padding: EdgeInsets.zero,
                          )),
                    ),
                    Positioned(
                        top: 50,
                        right: 20,
                        height: 50,
                        child: IconButton(
                          icon: Icon(
                            Icons.sort,
                            size: 30,
                            color: Colors.black,
                          ),
                          onPressed: () {},
                        )),
                    Positioned(
                      top: 100,
                      left: 20,
                      height: 50,
                      child: Text(
                        'Pokedex',
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 40),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
