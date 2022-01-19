import 'package:flutter_breaking/app/modules/character-detail/character_detail_binding.dart';
import 'package:flutter_breaking/app/modules/characters/characters_binding.dart';
import 'package:flutter_breaking/app/modules/characters/characters_screen.dart';
import 'package:flutter_breaking/app/routes/routes.dart';
import 'package:flutter_breaking/app/modules/character-detail/character_detail_screen.dart';
import 'package:get/get.dart';

class AppPages{
  static final List<GetPage> routes = <GetPage>[
    GetPage(
      name: Routes.CHARACTERS_SCREEN, 
      page: ()=> CharactersScreen(), 
      binding: CharactersBinding()
    ),
    GetPage(
      name: Routes.CHARACTER_DETAIL_SCREEN, 
      page: ()=> CharacterDetailScreen(), 
      binding: CharacterDetailBinding()
    )
  ];
}