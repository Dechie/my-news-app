import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_news_app/ui/shared/app_colors.dart';
import 'package:my_news_app/ui/shared/text_styles.dart';
import 'package:my_news_app/ui/widgets/buttons/blue_large_button.dart';
import 'package:my_news_app/ui/widgets/buttons/outlined_button.dart';
import 'package:my_news_app/ui/widgets/login_text_field.dart';

import '../shared/ui_helpers.dart';
import '../widgets/titled_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // since the figma design dimensions turn out to be
    // larger than usual mobile phone dimensions, we will scale it
    // to given screen size, and multiply every thing with that scale.

    var widthScale = size.width / 428;
    var heightScale = size.height / 926;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitledWidget(
                width: 329 * widthScale,
                height: 88 * heightScale,
                widthScale: widthScale,
                heightScale: heightScale,
                title: "Sign In",
                subtitle:
                    "Stay informed effortlessly. Sign in and explore a world of news",
              ),

              UIHelper.getVerticalSpaceMedium(size),
              SizedBox(
                height: 172 * heightScale,
                width: double.infinity,
                child: Form(
                  child: Column(
                    children: [
                      LoginTextField(
                        hintText: "Email",
                        prefixSvgPath: "email.svg",
                        width: double.infinity,
                        height: 64 * heightScale,
                        prefixSvgHeight: 20 * heightScale,
                        suffixSvgHeight: 0,
                      ),
                      LoginTextField(
                        hintText: "Password",
                        width: double.infinity,
                        height: 64 * heightScale,
                        prefixSvgHeight: 20 * heightScale,
                        suffixSvgHeight: 22 * heightScale,
                        prefixSvgPath: "lock.svg",
                        suffixSvgPath: "eye.svg",
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
              UIHelper.customVerticalSpace(20 * heightScale),
              CommonButton(
                onPress: () {},
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
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
              //const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: SizedBox(
                  height: 20 * heightScale,
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Don't have an account? ",
                            style: sourceSansW400B(16),
                          ),
                          TextSpan(
                            text: "Sign Up",
                            style: GoogleFonts.sourceSans3(
                              color: darkColor2,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
