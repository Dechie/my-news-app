// since the figma design dimensions turn out to be
// larger than usual mobile phone dimensions, we will scale it
// to given screen size, and multiply every thing with that scale.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_news_app/ui/widgets/bottom_nav_bar.dart';

import '../shared/app_colors.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({super.key});

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
      bottomNavigationBar: const BottomNavyBar(selectedIndex: 1),
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0.0),
            child: ListView(
              children: [
                Text(
                  "Discover",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 26 * widthScale,
                    color: darkColor,
                  ),
                ),
                Text(
                  "Uncover a world of captivating stories and stay informed",
                  style: GoogleFonts.sourceSans3(
                    fontSize: 18 * widthScale,
                    fontWeight: FontWeight.w400,
                    color: commonGreyColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 18.0 * widthScale),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
