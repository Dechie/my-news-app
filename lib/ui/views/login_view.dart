import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_news_app/ui/shared/app_colors.dart';
import 'package:my_news_app/ui/widgets/bottom_nav_bar.dart';
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
      bottomNavigationBar: const BottomNavyBar(
        selectedIndex: 1,
      ),
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
              // Text(
              //   "Sign In",
              //   textAlign: TextAlign.start,
              //   style: GoogleFonts.roboto(
              //     fontSize: 26,
              //     fontWeight: FontWeight.w600,
              //     color: darkColor,
              //   ),
              // ),
              // UIHelper.customVerticalSpace(6),
              // Text(
              //   textAlign: TextAlign.start,
              //   "Stay informed effortlessly. Sign in and explore a world of news",
              //   style: subHeaderStyle,
              // ),
              UIHelper.getVerticalSpaceMedium(size),
              SizedBox(
                height: size.height * 0.215,
                width: double.infinity,
                child: Form(
                  child: Column(
                    children: [
                      const LoginTextField(
                        hintText: "Email",
                        prefixIcon: Icons.email,
                        width: double.infinity,
                        height: 64,
                      ),
                      const LoginTextField(
                        hintText: "Password",
                        width: double.infinity,
                        height: 64,
                        prefixIcon: Icons.lock,
                        suffixIcon: Icons.remove_red_eye,
                      ),
                      UIHelper.customVerticalSpace(6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forgot Password?",
                            style: GoogleFonts.sourceSans3(
                              color: commonGreyColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              UIHelper.verticalSpaceMedium,
              CommonButton(
                onPress: () {},
                width: size.width * 0.9,
                height: 45,
              ),
              UIHelper.verticalSpaceMedium,
              SizedBox(
                height: 20,
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
                        style: GoogleFonts.sourceSans3(
                          color: commonGreyColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 3,
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
              UIHelper.customVerticalSpace(25),
              MyOutlinedButton(
                imagePath: "google-logo.png",
                text: "Sign in with Google",
                onPress: () {},
                width: size.width * 0.9,
                height: 45,
              ),
              UIHelper.customVerticalSpace(12),
              MyOutlinedButton(
                imagePath: "fb-logo.png",
                text: "Sign in with Facebook",
                onPress: () {},
                width: size.width * 0.9,
                height: 45,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: SizedBox(
                  height: 20,
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Don't have an account? ",
                            style: GoogleFonts.sourceSans3(
                              color: commonGreyColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                              text: "Sign Up",
                              style: GoogleFonts.sourceSans3(
                                color: darkColor2,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {}),
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
