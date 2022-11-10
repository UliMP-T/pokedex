import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pokedex/data/api/models/pokemon.dart';

import 'package:pokedex/data/api/services/get_api_services.dart';

class ManagerController extends GetxController {
  late List<Pokemon> _pokemons;
  var _characterObservable;

  final GetApiServices getApiServices = Get.find<GetApiServices>();

  @override
  void onInit() {
    super.onInit();
    getApiServices.getPokemons();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
