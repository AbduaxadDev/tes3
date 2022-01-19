class Character {
  int charId = 0;
  String name = '';
  String nickName = '';
  String image = '';
  List<dynamic> jobs = [];
  String statusIfDeadOrAlive = '';
  List<dynamic> appearanceOfSeasons = [];
  String acotrName = '';
  String categoryForTwoSeries = '';
  List<dynamic> betterCallSaulAppearance = [];

  Character();

  Character.fromJson(Map<String, dynamic> json) {
    charId = json["char_id"];
    name = json["name"];
    nickName = json["nickname"];
    image = json["img"];
    jobs = json["occupation"];
    statusIfDeadOrAlive = json["status"];
    appearanceOfSeasons = json["appearance"];
    acotrName = json["portrayed"];
    categoryForTwoSeries = json["category"];
    betterCallSaulAppearance = json["better_call_saul_appearance"];
  }
}