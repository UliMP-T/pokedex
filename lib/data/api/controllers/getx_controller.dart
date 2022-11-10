import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class GetXController extends GetxController {
  int ammount = 26;

  void increment() {
    ammount = ammount + 26;
    update();
  }
}
