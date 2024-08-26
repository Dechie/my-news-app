import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_news_app/core/viewModels/login_v_model.dart';
import 'package:my_news_app/ui/shared/app_colors.dart';
import 'package:my_news_app/ui/shared/text_styles.dart';
import 'package:my_news_app/ui/widgets/buttons/blue_large_button.dart';
import 'package:my_news_app/ui/widgets/buttons/outlined_button.dart';
import 'package:my_news_app/ui/widgets/login_text_field.dart';

import '../../core/constants/app_contstants.dart';
import '../../core/constants/enums.dart';
import '../shared/ui_helpers.dart';
import '../widgets/titled_widget.dart';
import 'base/base_view.dart';

class LoginView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var widthScale = size.width / 428;
    var heightScale = size.height / 926;

    return BaseView<LoginVModel>(
      onModelReady: (LoginVModel viewModel) {},
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset:
              true, // Allow content to resize when the keyboard appears
          body: SafeArea(
            child: SingleChildScrollView(
              // Wrap content in SingleChildScrollView to enable scrolling
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitledWidget(
                      width: 352 * widthScale,
                      height: 88 * heightScale,
                      widthScale: widthScale,
                      heightScale: heightScale,
                      title: "Sign In",
                      subtitle:
                          "Stay informed effortlessly. Sign in and explore a world of news",
                    ),
                    UIHelper.customVerticalSpace(32 * heightScale),
                    SizedBox(
                      height: 172 * heightScale,
                      width: double.infinity,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            LoginTextField(
                              editingController: _emailController,
                              hintText: "Email",
                              prefixSvgPath: "email.svg",
                              width: double.infinity,
                              height: 64 * heightScale,
                              prefixSvgHeight: 20 * heightScale,
                              suffixSvgHeight: 0,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Email field empty";
                                }
                                return null;
                              },
                              onSaved: (value) {},
                            ),
                            LoginTextField(
                              editingController: _passwordController,
                              hintText: "Password",
                              width: double.infinity,
                              height: 64 * heightScale,
                              prefixSvgHeight: 20 * heightScale,
                              suffixSvgHeight: 22 * heightScale,
                              prefixSvgPath: "lock.svg",
                              suffixSvgPath: "eye.svg",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Password field empty";
                                }
                                return null;
                              },
                              onSaved: (value) {},
                            ),
                            UIHelper.customVerticalSpace(6 * heightScale),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Forgot Password?",
                                  style: sourceSansW400B(widthScale),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (viewModel.state == ViewState.error)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          viewModel.error,
                          style: sourceSansW400B(widthScale).copyWith(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    CommonButton(
                      childWidget: viewModel.state == ViewState.busy
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : null,
                      onPress: () async {
                        if (_formKey.currentState!.validate()) {
                          bool success = await viewModel.login(
                            _emailController.text,
                            _passwordController.text,
                          );
                          if (success && context.mounted) {
                            Navigator.of(context).pushNamed(RoutePaths.home);
                          }
                        }
                      },
                      width: 392 * widthScale,
                      height: 55 * heightScale,
                    ),
                    UIHelper.customVerticalSpace(20 * heightScale),
                    SizedBox(
                      height: 20 * heightScale,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 2,
                              decoration: BoxDecoration(
                                color: lighterGrey,
                                border: Border.all(
                                  color: lighterGrey,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Text(
                              "Or",
                              style: sourceSansW400B(widthScale),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 2,
                              decoration: BoxDecoration(
                                color: lighterGrey,
                                border: Border.all(
                                  color: lighterGrey,
                                  width: 1,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    UIHelper.customVerticalSpace(25 * heightScale),
                    MyOutlinedButton(
                      imagePath: "google-logo.png",
                      text: "Sign in with Google",
                      onPress: () {},
                      width: 392 * widthScale,
                      height: 55 * heightScale,
                    ),
                    UIHelper.customVerticalSpace(12),
                    MyOutlinedButton(
                      imagePath: "fb-logo.png",
                      text: "Sign in with Facebook",
                      onPress: () {},
                      width: 392 * widthScale,
                      height: 55 * heightScale,
                    ),
                    UIHelper.customVerticalSpace(20 * heightScale),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: SizedBox(
                        height: 20 * heightScale,
                        width: double.infinity,
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Don't have an account? ",
                                  style: sourceSansW400B(12 * widthScale),
                                ),
                                TextSpan(
                                  text: "Sign Up",
                                  style: GoogleFonts.sourceSans3(
                                    color: darkColor2,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12 * widthScale,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    UIHelper.customVerticalSpace(18),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
