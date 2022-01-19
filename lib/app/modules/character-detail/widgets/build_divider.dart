import 'package:flutter/material.dart';
import 'package:flutter_breaking/utils/my_colors.dart';

class BuildDivider extends StatelessWidget {
  final double endIndent;

  const BuildDivider({ this.endIndent = 10 });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: MyColors.yellow,
      thickness: 2,
    );
  }
}