import 'package:get_it/get_it.dart';
import 'package:my_news_app/core/services/authentication_service.dart';
import 'package:my_news_app/core/viewModels/login_v_model.dart';

import 'core/services/api.dart';

/// unlike common practice with provider
/// state management,  we will not be providing a bunch
/// of models and services at the beginning of our app at global
/// context scale (i.e. main.dart). Instead we’ll inject it using
/// the locator setup in this file

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());

  locator.registerLazySingleton(() => LoginVModel());
}
