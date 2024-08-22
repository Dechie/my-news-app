import 'package:flutter/material.dart';

import '../shared/app_colors.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: backgroundColor,
        body: Center(child: Text('Login View')));
  }
}
