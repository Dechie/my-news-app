import 'dart:async';

import '../models/user.dart';

class AuthenticationService {
  final StreamController<User> _userController = StreamController<User>();

  //AuthenticationService({required Api api}) : _api = api;
  AuthenticationService();

  Stream<User> get user => _userController.stream;

  Future<bool> login(String email, String password) async {
    /// this mocks the api request by creating a delay.
    await Future.delayed(const Duration(seconds: 3));
    var fetchedUser = (email == "tyler@gmail.com" && password == "1234")
        ? User.initial()
        : null;
    print("fetched user: $fetchedUser");

    var hasUser = fetchedUser != null;
    if (hasUser) {
      _userController.add(fetchedUser);
    } else {
      throw Exception("Incorrect Credentials");
    }
    return hasUser;
  }
}
