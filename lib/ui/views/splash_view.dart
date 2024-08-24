import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_news_app/ui/shared/app_colors.dart';
import 'package:my_news_app/ui/shared/ui_helpers.dart';

import '../widgets/bottom_nav_bar.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryBlue,
      
      body: Center(
        child: SizedBox(
            width: size.width * 0.2,
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
  }
}
