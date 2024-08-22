import 'package:flutter/material.dart';

import '../shared/app_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Text('Home View'),
      ),
    );
  }
}
