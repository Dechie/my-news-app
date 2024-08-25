import 'package:flutter/material.dart';
import 'package:my_news_app/core/services/authentication_service.dart';
import 'package:my_news_app/core/viewModels/base/base_view_movel.dart';

import '../../locator.dart';
import '../constants/enums.dart';

class LoginVModel extends BaseViewModel {
  /// api service for authentication
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  /// the state of the view. while it's doing api request
  /// or any other async task it is busy, and other times
  /// it is idle. also, if the value has an error, it takes
  /// a state of error. we model this with enum values.

  void clearError() {
    setError(error);
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
      setError(e.toString());
      setState(ViewState.error);
    }

    // if successfuly performed, set state to idle
    if (success) {
      setState(ViewState.idle);
    }
    return success;
  }

}
