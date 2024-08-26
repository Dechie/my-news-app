import 'package:my_news_app/core/constants/enums.dart';

import '../../locator.dart';
import '../services/shared_pref_services.dart';
import 'base/base_view_movel.dart';

class SplashVModel extends BaseViewModel {
  final SharedPreferencesService _prefsService =
      locator<SharedPreferencesService>();

  bool _hasUser = false;

  SplashVModel();
  bool get hasUser => _hasUser;

  /// Check if the user has logged in before.
  Future<void> checkLoginStatus() async {
    setState(ViewState.busy);
    try {
      bool hasAUser = await _prefsService.checkHasUser();
      _hasUser = hasAUser;
    } catch (e) {
      setError(e.toString());
      setState(ViewState.error);
      return;
    }
    setState(ViewState.idle);
  }

  /// Clear the login status, typically used on logout.
  Future<void> clearLoginStatus() async {
    await _prefsService.clearLoginStatus();
  }

  /// Set the login status after a successful login or logout.
  Future<void> setLoginStatus(bool isLoggedIn) async {
    setState(ViewState.busy);
    try {
      await _prefsService.setLoginStatus(isLoggedIn);
    } catch (e) {
      setError(e.toString());
      setState(ViewState.error);
      return;
    }
    setState(ViewState.idle);
  }
}
