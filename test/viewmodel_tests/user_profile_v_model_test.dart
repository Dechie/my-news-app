import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_news_app/core/constants/enums.dart';
import 'package:my_news_app/core/models/user.dart';
import 'package:my_news_app/core/services/api.dart';
import 'package:my_news_app/core/viewModels/user_profile_v_model.dart';

void main() {
  group("UserProfileViewModelTest -", () {
    late UserProfileVModel viewModel;
    late MockApi mockApi;

    setUp(() {
      mockApi = MockApi();
      viewModel = UserProfileVModel();
    });

    test("initial state should be idle", () {
      expect(viewModel.state, ViewState.idle);
    });

    test("getUser should set state to busy, then idle on success", () async {
      when(mockApi.getUserProfile())
          .thenAnswer((_) => Future.value(User.fromMockAPI()));

      await viewModel.getUser();

      expect(viewModel.state, ViewState.idle);
    });

    test("getUser should set state to busy, then error on failure", () async {
      when(mockApi.getUserProfile())
          .thenThrow(Exception("Error fetching user"));

      await viewModel.getUser();

      expect(viewModel.state, ViewState.error);
      expect(viewModel.error, "Error fetching user");
    });

    test("getUser should update user on success", () async {
      User expectedUser = User.fromMockAPI();
      when(mockApi.getUserProfile())
          .thenAnswer((_) => Future.value(expectedUser));

      await viewModel.getUser();

      expect(viewModel.user, expectedUser);
    });
  });
}

class MockApi extends Mock implements Api {
  @override
  Future<User> getUserProfile() async {
    await Future.delayed(const Duration(seconds: 2));
    return User.fromMockAPI();
  }
}
