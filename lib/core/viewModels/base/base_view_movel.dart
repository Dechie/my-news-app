import 'package:flutter/material.dart';

import '../../constants/enums.dart';
/// this class abstracts the common attributes of all
/// out view models. including the states and the methods
/// that set the state and notify listeners.
class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.idle;

  String _error = "no error";

  String get error => _error;
  ViewState get state => _state;

  void setError(String error) {
    _error = error;
    notifyListeners();
  }

  /// we create a custom setState function that updates the
  /// viewstate of the view/screen.
  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
