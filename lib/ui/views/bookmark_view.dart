import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_news_app/ui/widgets/search_bar.dart';

import '../shared/app_colors.dart';
import '../shared/text_styles.dart';
import '../shared/ui_helpers.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/buttons/square_svg_button.dart';

class BookmarkView extends StatelessWidget {
  const BookmarkView({
    super.key,
  });

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
      bottomNavigationBar: const BottomNavyBar(selectedIndex: 2),
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,

          /// padding for the whole screen.
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0.0),
            child: ListView(
              children: [
                SizedBox(
                  width: size.width * 0.9,
                  height: 59,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "Boomarks",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w600,
                            fontSize: 24 * heightScale,
                            color: darkColor,
                          ),
                        ),
                      ),

                      // svg settings button
                      SquareSVGButton(
                        widthScale: widthScale,
                        heightScale: heightScale,
                        onPress: () {},
                        iconPath: "three_dots.svg",
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Text(
                    "Personal collection of noteworthy reads",
                    style: sourceSansW400A(heightScale),
                  ),
                ),
                UIHelper.customVerticalSpace(32 * heightScale),
                CustomSearchBar(
                  widthScale: widthScale,
                  heightScale: heightScale,
                  customLabel: "Search \"Collection\"",
                ),
                UIHelper.customVerticalSpace(32 * heightScale),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
