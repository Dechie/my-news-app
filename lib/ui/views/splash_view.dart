import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_news_app/core/constants/enums.dart';
import 'package:my_news_app/core/viewModels/splash_view_model.dart';
import 'package:my_news_app/ui/shared/app_colors.dart';
import 'package:my_news_app/ui/shared/text_styles.dart';
import 'package:my_news_app/ui/shared/ui_helpers.dart';
import 'package:my_news_app/ui/views/base/base_view.dart';

import '../../core/constants/app_contstants.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // since the figma design dimensions turn out to be
    // larger than usual mobile phone dimensions, we will scale it
    // to given screen size, and multiply every thing with that scale.
    var widthScale = size.width / 428;
    var heightScale = size.height / 926;
    return BaseView<SplashVModel>(
      onModelReady: (viewModel) async {
        viewModel.checkLoginStatus();

        await Future.delayed(const Duration(seconds: 3));
        // check if user is already logged in
        // before and if so go to home page.
        if (viewModel.state == ViewState.error) {
          /// if an error occurs during login check
          /// via shared preferences, then show this snackbar
          /// that displays the exception.
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.white,
              content: Text(
                viewModel.error,
                style: robotoW500(heightScale).copyWith(
                  color: Colors.red,
                ),
              ),
            ),
          );
        }
        if (viewModel.isLoggedIn) {
          Navigator.pushNamed(context, RoutePaths.home);
        } else {
          /// if user is not logged in then
          /// goto onboarding page then from there goto
          /// login page.
          Navigator.of(context).pushNamed(RoutePaths.onboarding);
        }
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: primaryBlue,
          body: Center(
            child: SizedBox(
                width: size.width * 0.5,
                height: size.height * .2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Text(
                          'yours',
                          style: GoogleFonts.pinyonScript(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        UIHelper.horizontalSpaceSmall,
                        UIHelper.tinyRedStar,
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        UIHelper.tinyRedStar,
                        UIHelper.horizontalSpaceSmall,
                        Text(
                          'News',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 49.08,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }
}
