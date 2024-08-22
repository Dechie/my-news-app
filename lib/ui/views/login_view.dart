import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_news_app/ui/shared/app_colors.dart';
import 'package:my_news_app/ui/widgets/blue_large_button.dart';
import 'package:my_news_app/ui/widgets/login_text_field.dart';
import 'package:my_news_app/ui/widgets/outlined_button.dart';

import '../shared/ui_helpers.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sign In",
                textAlign: TextAlign.start,
                style: GoogleFonts.roboto(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: darkColor,
                ),
              ),
              UIHelper.customVerticalSpace(6),
              Text(
                textAlign: TextAlign.start,
                "Stay informed effortlessly. Sign in and explore a world of news",
                style: GoogleFonts.sourceSans3(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: commonGreyColor,
                ),
              ),
              UIHelper.getVerticalSpaceMedium(size),
              SizedBox(
                height: size.height * 0.21,
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
                          color: const Color(0xffededed),
                          border: Border.all(
                            color: const Color(0xffededed),
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
                          color: const Color(0xffededed),
                          border: Border.all(
                            color: const Color(0xffededed),
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
                                color: const Color(0xff121314),
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
