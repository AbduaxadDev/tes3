import 'package:flutter_breaking/app/modules/characters/characters_controller.dart';
import 'package:get/get.dart';

class CharactersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CharactersController());
  }
}
