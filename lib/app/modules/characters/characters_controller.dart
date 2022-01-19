import 'package:flutter/widgets.dart';
import 'package:flutter_breaking/app/data/model/characters.dart';
import 'package:flutter_breaking/app/data/repository/characters_repository.dart';
import 'package:flutter_breaking/app/data/provider/characters_provider.dart';
import 'package:get/get.dart';

class CharactersController extends GetxController {
  RxList<Character> allCharacters = <Character>[].obs;
  CharactersRepository repository = new CharactersRepository(new CharactersProvider());

  RxBool _isSearching = false.obs;

  bool get isSearching => _isSearching.value;

  set isSearching(bool value) => _isSearching.value = value;

  RxString _filter = ''.obs;

  String get filter => _filter.value;

  set filter(String value) => _filter.value = value;

  final searchTextController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    repository = Get.find();
    await setCharacters();
  }

  Future<void> setCharacters() async {
    this.allCharacters.addAll(await this.repository.getAllCharacters());

  }

  RxList<Character> get listCharactersFilter {
    if (this.filter.isEmpty) {
      return this.allCharacters;
    } else {
      return this
          .allCharacters
          .where((Character character) =>
              character.name.toUpperCase().contains(this.filter.toUpperCase()))
          .toList()
          .obs;
    }
  }

  void stopSearching() {
    clearSearch();

    isSearching = false;
  }

  void clearSearch() {
    searchTextController.clear();
    this.filter = '';
    
  }

  void startSearch() {

    isSearching = true;
  }

  void setFilter(String searchedCharacter) {
    this.filter = searchedCharacter;
  }
}
