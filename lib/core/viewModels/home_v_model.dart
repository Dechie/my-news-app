import 'package:flutter/material.dart';

import '../constants/enums.dart';

class HomeVModel extends ChangeNotifier {
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  //Future<void> get 

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
