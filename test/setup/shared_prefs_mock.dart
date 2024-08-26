import 'package:mockito/mockito.dart';
import 'package:my_news_app/core/services/shared_pref_services.dart';

/// this mocks the shared preferences service.
/// now we can use it to perform single
/// functionality of the service without having
/// to call it(the service) as a whole
class SharedPrefsMock extends Mock implements SharedPreferencesService {
  @override
  Future<bool> checkHasUser() async {
    // Implement your mock logic here

    return true;
  }
}
