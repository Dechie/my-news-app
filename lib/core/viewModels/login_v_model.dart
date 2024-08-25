import 'package:flutter/material.dart';
import 'package:my_news_app/core/services/authentication_service.dart';

import '../../locator.dart';
import '../constants/enums.dart';

class LoginVModel extends ChangeNotifier {
  /// api service for authentication
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  /// the state of the view. while it's doing api request
  /// or any other async task it is busy, and other times
  /// it is idle. also, if the value has an error, it takes
  /// a state of error. we model this with enum values.
  ViewState _state = ViewState.idle;
  String _error = "no error";

  String get error => _error;
  ViewState get state => _state;

  void clearError() {
    _error = "";
    setState(ViewState.idle);
  }

  /// we create an async function that talks to the api
  /// class. note: this is simply a mock of the api and not
  /// an actual api request task
  Future<bool> login(String email, String password) async {
    bool? success;
    try {
      setState(ViewState.busy);
      success = await _authenticationService.login(email, password);
    } catch (e) {
      success = false;
      // if error happend, set state to error
      _error = e.toString();
      setState(ViewState.error);
    }

    // if successfuly performed, set state to idle
    if (success) {
      setState(ViewState.idle);
    }
    return success;
  }

  /// we create a custom setState function that updates the
  /// viewstate of the view/screen.
  void setState(ViewState newState) {
    _state = newState;
    notifyListeners();
  }
}
