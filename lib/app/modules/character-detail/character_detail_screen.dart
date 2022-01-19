import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breaking/app/modules/character-detail/character_detail_controller.dart';
import 'package:flutter_breaking/app/modules/character-detail/widgets/build_divider.dart';
import 'package:flutter_breaking/app/modules/character-detail/widgets/character_info.dart';
import 'package:flutter_breaking/utils/my_colors.dart';
import 'package:get/get.dart';

class CharacterDetailScreen extends GetView<CharacterDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.dark,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 600,
            pinned: true,
            stretch: true,
            backgroundColor: MyColors.dark_100,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                controller.character.nickName,
                style: TextStyle(color: MyColors.white),
              ),
              background: Hero(
                tag: controller.character.charId,
                child: Image.network(
                  controller.character.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CharacterInfo(
                          title: 'Job : ',
                          join: controller.character.jobs.join(' / ')),
                      BuildDivider(endIndent: 315),
                      CharacterInfo(
                          title: 'Appeared in : ',
                          join: controller.character.categoryForTwoSeries),
                      BuildDivider(endIndent: 250),
                      CharacterInfo(
                          title: 'Seasons : ',
                          join: controller.character.appearanceOfSeasons
                              .join(' / ')),
                      BuildDivider(endIndent: 280),
                      CharacterInfo(
                          title: 'Status : ',
                          join: controller.character.statusIfDeadOrAlive),
                      BuildDivider(endIndent: 300),
                      controller.character.betterCallSaulAppearance.isEmpty
                          ? Container()
                          : CharacterInfo(
                              title: 'Better Call Saul Seasons : ',
                              join: controller
                                  .character.betterCallSaulAppearance
                                  .join(" / ")),
                      controller.character.betterCallSaulAppearance.isEmpty
                          ? Container()
                          : BuildDivider(endIndent: 150),
                      CharacterInfo(
                          title: 'Actor/Actress : ',
                          join: controller.character.acotrName),
                      BuildDivider(endIndent: 235),
                      SizedBox(
                        height: 20,
                      ),
                      Obx(() {
                        if (controller.quotes.isNotEmpty) {
                          int randomQuoteIndex =
                              Random().nextInt(controller.quotes.length - 1);

                          return Center(
                            child:
                                Text(controller.quotes[randomQuoteIndex].quote,
                                style: TextStyle(fontSize: 20,color: Colors.white),
                                ),
                          );
                        } else {
                          return controller.isLoading
                              ? Center(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        MyColors.white),
                                  ),
                                )
                              : Container();
                        }
                      }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 500,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*
DefaultTextStyle(
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                color: MyColors.white,
                                shadows: [
                                  Shadow(
                                    blurRadius: 7,
                                    color: MyColors.white,
                                    offset: Offset(0, 0),
                                  )
                                ],
                              ),
                              child: AnimatedTextKit(
                                repeatForever: true,
                                animatedTexts: [
                                  FlickerAnimatedText(controller
                                      .quotes[randomQuoteIndex].quote),
                                ],
                              ),
                            ),
 */