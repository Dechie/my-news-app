import 'package:get_it/get_it.dart';
import 'package:my_news_app/core/services/authentication_service.dart';
import 'package:my_news_app/core/viewModels/home_v_model.dart';
import 'package:my_news_app/core/viewModels/login_v_model.dart';
import 'package:my_news_app/core/viewModels/splash_view_model.dart';
import 'package:my_news_app/core/viewModels/user_profile_v_model.dart';

import 'core/services/api.dart';
import 'core/viewModels/discover_v_model.dart';

/// unlike common practice with provider
/// state management,  we will not be providing a bunch
/// of models and services at the beginning of our app at global
/// context scale (i.e. main.dart). Instead we’ll inject it using
/// the locator setup in this file

GetIt locator = GetIt.instance;

/// every view-model and service class has to be
/// registered here because we don't pass any providers
/// through root app at main.dart, we just "locate" them
/// from wherever we want using *this locator.
void setupLocator() {
  /// service classes
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());

  /// view-models
  locator.registerLazySingleton(() => SplashVModel());
  locator.registerLazySingleton(() => LoginVModel());
  locator.registerLazySingleton(() => HomeVModel());
  locator.registerLazySingleton(() => DiscoverVModel());
  locator.registerLazySingleton(() => UserProfileVModel());
}
