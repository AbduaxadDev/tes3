import 'package:flutter/material.dart';
import 'package:flutter_breaking/utils/my_colors.dart';

class CharacterInfo extends StatelessWidget {
  final String? title;
  final String? join;
  const CharacterInfo({@required this.title, @required this.join});

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: MyColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: join,
            style: TextStyle(
              color: MyColors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
