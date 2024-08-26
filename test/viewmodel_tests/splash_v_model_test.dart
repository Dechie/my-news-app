// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:my_news_app/core/services/shared_pref_services.dart';
// import 'package:my_news_app/core/viewModels/splash_view_model.dart';
// import 'package:my_news_app/locator.dart';

// import '../setup/shared_prefs_mock.dart';

// void main() {
//   group("SplashViewModelTest -", () {
//     setUp(() {
//       // Register the mock in the service locator
//       var sharedPrefs = SharedPrefsMock();
//       locator.registerSingleton<SharedPreferencesService>(sharedPrefs);

//       // Ensure the mock returns a Future<bool>
//       when(sharedPrefs.checkHasUser()).thenAnswer((_) async {
//         final result = await sharedPrefs.checkHasUser();
//         return result ?? false;
//       });
//     });

//     group("initialize", () {
//       test("when called should check hasUser on sharedPrefs service", () async {
//         // Retrieve the mock from the service locator
//         var sharedPrefs = locator<SharedPreferencesService>();
//         var viewModel = SplashVModel();

//         // Call the method that checks whether the user has been saved on device
//         await viewModel.checkLoginStatus();

//         // Verify that checkHasUser was called on the sharedPrefs mock
//         verify(sharedPrefs.checkHasUser()).called(1);
//       });
//     });
//   });
// }
