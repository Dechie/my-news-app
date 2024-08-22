import 'package:flutter/material.dart';
import 'package:my_news_app/ui/views/onboarding_view.dart';
import 'package:my_news_app/ui/views/splash_view.dart';

import '../core/constants/app_contstants.dart';
import 'views/home_view.dart';
import 'views/login_view.dart';

class RouterUtil {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case RoutePaths.hoome:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case RoutePaths.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case RoutePaths.login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
