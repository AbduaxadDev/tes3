import 'package:flutter_breaking/app/data/model/characters.dart';
import 'package:flutter_breaking/app/data/repository/characters_repository.dart';
import 'package:flutter_breaking/app/data/provider/characters_provider.dart';
import 'package:flutter_breaking/app/data/model/quote.dart';
import 'package:get/get.dart';

class CharacterDetailController extends GetxController {

  Character character = new Character();
  CharactersRepository repository = new CharactersRepository(new CharactersProvider());
  RxList<Quote> quotes = <Quote>[].obs;
  RxBool _isLoading = true.obs;

  bool get isLoading => _isLoading.value;

  set isLoading(bool value)=> _isLoading.value = value;
  @override
    void onInit() async {
      
      super.onInit();

      repository = Get.find();

      character = Get.arguments as Character;

      await this.setQuotes();
    
    }

    Future<void> setQuotes() async {
      this.quotes.addAll(await this.repository.getCharacterQuotes(this.character.name));

        isLoading = false;
        
    }

}