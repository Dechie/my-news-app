import 'package:flutter/material.dart';
import 'package:my_news_app/ui/views/discover_view.dart';
import 'package:my_news_app/ui/views/onboarding_view.dart';
import 'package:my_news_app/ui/views/single_publisher.dart';
import 'package:my_news_app/ui/views/splash_view.dart';

import '../core/constants/app_contstants.dart';
import '../core/models/news_agency.dart';
import 'views/home_view.dart';
import 'views/login_view.dart';

/// this page generates routes for the views,
/// in a way that's suitable for named navigator
/// that is the preferred way of navigation
class RouterUtil {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case RoutePaths.home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case RoutePaths.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case RoutePaths.login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case RoutePaths.discover:
        return MaterialPageRoute(builder: (_) => const DiscoverView());
      case RoutePaths.singlePublisher:
        final publisher =
            settings.arguments as NewsAgency?; // Cast arguments to NewsAgency
        return MaterialPageRoute(
          builder: (_) => SinglePublisherView(
            publisher: publisher,
          ),
        );
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
