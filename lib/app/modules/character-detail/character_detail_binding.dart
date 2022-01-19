import 'package:flutter_breaking/app/modules/character-detail/character_detail_controller.dart';
import 'package:get/get.dart';

class CharacterDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CharacterDetailController());
  }
}