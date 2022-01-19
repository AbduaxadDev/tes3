import 'package:flutter/material.dart';
import 'package:flutter_breaking/app/data/manager/manager_binding.dart';
import 'package:flutter_breaking/app/routes/app_pages.dart';
import 'package:flutter_breaking/app/routes/routes.dart';
import 'package:get/get.dart';

void main() => runApp(BreakingBadApp());

class BreakingBadApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Breaking Bad App',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.CHARACTERS_SCREEN,
      initialBinding: ManagerBinding(),
      getPages: AppPages.routes,
    );
  }
}
