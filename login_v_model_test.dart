import 'package:flutter_test/flutter_test.dart';
import 'package:my_news_app/core/constants/enums.dart';
import 'package:my_news_app/core/viewModels/login_v_model.dart';

void main() {
  late LoginVModel viewModel;

  setUp(() {
    viewModel = LoginVModel();
  });

  group('LoginVModel Tests', () {
    test('Login successful', () async {
      final result = await viewModel.login('tyler@gmail.com', '1234');
      expect(result, true);
      expect(viewModel.state, ViewState.idle);
    });

    test('Login failure', () async {
      final result =
          await viewModel.login('wrongemail@gmail.com', 'password123');
      expect(result, false);
      expect(viewModel.state, ViewState.error);
    });
  });
}
