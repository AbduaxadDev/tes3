import 'package:flutter_breaking/app/data/provider/characters_provider.dart';
import 'package:flutter_breaking/app/data/repository/characters_repository.dart';
import 'package:get/get.dart';

class ManagerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CharactersRepository(CharactersProvider()));
  }
}