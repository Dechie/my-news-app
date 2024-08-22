import 'package:flutter/material.dart';

import 'core/constants/app_contstants.dart';
import 'ui/router.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutePaths.splash,
      onGenerateRoute: RouterUtil.generateRoute,
    );
  }
}
