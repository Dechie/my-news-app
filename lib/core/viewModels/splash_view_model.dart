import 'package:my_news_app/core/constants/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base/base_view_movel.dart';

class SplashVModel extends BaseViewModel {
  static const String _isLoggedInKey = 'isLoggedIn';
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  /// Check if the user has logged in before.
  Future<void> checkLoginStatus() async {
    setState(ViewState.busy);
    try {
      final prefs = await SharedPreferences.getInstance();
      _isLoggedIn = prefs.getBool(_isLoggedInKey) ?? false;
    } catch (e) {
      setError(e.toString());
      setState(ViewState.error);
      return;
    }
    setState(ViewState.idle);
  }

  /// Clear the login status, typically used on logout.
  Future<void> clearLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_isLoggedInKey);
  }

  /// Set the login status after a successful login or logout.
  Future<void> setLoginStatus(bool isLoggedIn) async {
    setState(ViewState.busy);
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_isLoggedInKey, isLoggedIn);
    } catch (e) {
      setError(e.toString());
      setState(ViewState.error);
      return;
    }
    setState(ViewState.idle);
  }
}
