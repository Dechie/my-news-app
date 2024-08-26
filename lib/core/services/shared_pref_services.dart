import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String _isLoggedInKey = 'isLoggedIn';

  Future<bool> checkHasUser() async {
    final prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn = prefs.getBool(_isLoggedInKey);
    if (isLoggedIn == null) return false;
    return isLoggedIn;
  }

  Future<void> clearLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_isLoggedInKey);
  }

  Future<void> setLoginStatus(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, isLoggedIn);
  }
}
