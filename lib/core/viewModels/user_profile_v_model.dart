import 'package:my_news_app/core/constants/enums.dart';
import 'package:my_news_app/core/viewModels/base/base_view_movel.dart';

import '../models/user.dart';
import '../services/api.dart';

class UserProfileVModel extends BaseViewModel {
  final apiService = Api();

  User _user = User.initial();
  User get user => _user;

  Future<void> getUser() async {
    setState(ViewState.busy);
    try {
      User aUser = await apiService.getUserProfile();
      _user = aUser;
      setState(ViewState.idle);
    } catch (e) {
      setError(e.toString());
      setState(ViewState.error);
    }
  }
}
