import 'package:flutter/material.dart';
import 'package:my_news_app/locator.dart';

import 'core/constants/app_contstants.dart';
import 'ui/router.dart';

void main() {
  // call the locator's setup function here.
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutePaths.login,
      onGenerateRoute: RouterUtil.generateRoute,
    );
  }
}
