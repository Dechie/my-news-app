import 'package:flutter/material.dart';

const double commonBorderRadius = 13.7;

/// this file states the names of the routes,
/// so that we can use named navigators using these
/// then, [Router] class could use these to generate the
/// actual [MaterialPageRoute] of the screens.
class RoutePaths {
  static const String splash = 'splash';
  static const String onboarding = 'onboarding';
  static const String login = 'login';
  static const String home = 'home';
  static const String singlePublisher = 'singlePublisher';
  static const String userProfile = 'userProfile';
  static const String discover = "discover";
  static const String bookmarks = "bookmarks";
}
