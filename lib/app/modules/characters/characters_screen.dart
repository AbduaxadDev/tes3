import 'package:flutter/material.dart';
import 'package:flutter_breaking/app/modules/characters/characters_controller.dart';
import 'package:flutter_breaking/utils/my_colors.dart';
import 'package:flutter_breaking/app/data/model/characters.dart';
import 'package:flutter_breaking/app/modules/characters/widgets/character_item.dart';
import 'package:get/get.dart';

class CharactersScreen extends GetView<CharactersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.dark,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyColors.dark_100,
        leading: Obx(() => controller.isSearching
            ? BackButton(
                color: MyColors.white,
                onPressed: (){
                  controller.stopSearching();
                },
              )
            : Container()),
        title: Obx(() => controller.isSearching
            ? TextField(
                controller: controller.searchTextController,
                cursorColor: MyColors.grey,
                decoration: InputDecoration(
                  hintText: 'Find a character...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: MyColors.white, fontSize: 18),
                ),
                style: TextStyle(color: MyColors.white, fontSize: 18),
                onChanged: controller.setFilter,
                
              )
            : Text(
                'Characters',
                style: TextStyle(color: MyColors.white),
              )),
        actions: [
          Obx(() => controller.isSearching
              ? IconButton(
                  onPressed: () {
                    controller.clearSearch();
                    
                  },
                  icon: Icon(Icons.clear, color: MyColors.white),
                )
              : IconButton(
                  onPressed: controller.startSearch,
                  icon: Icon(
                    Icons.search,
                    color: MyColors.white,
                  ),
                ))
        ],
      ),
      body: Obx(() => controller.allCharacters.isNotEmpty
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: controller.listCharactersFilter.length,
              itemBuilder: (_, index) {
                Character character = controller.listCharactersFilter[index];
                return CharacterItem(
                  character,
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(MyColors.white),
              ),
            )),
    );
  }
}
