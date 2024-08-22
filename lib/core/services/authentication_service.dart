import 'dart:async';

import '../models/user.dart';

class AuthenticationService {
  //final Api? _api;

  final StreamController<User> _userController = StreamController<User>();

  //AuthenticationService({required Api api}) : _api = api;
  AuthenticationService();

  Stream<User> get user => _userController.stream;

  Future<bool> login(int userId) async {
    //var fetchedUser = await _api?.getUserProfile(userId);
    await Future.delayed(const Duration(seconds: 3));
    var fetchedUser = User.initial();

    var hasUser = fetchedUser != null;
    if (hasUser) {
      _userController.add(fetchedUser);
    }
    return hasUser;
  }
}
