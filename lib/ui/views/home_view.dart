import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_news_app/ui/shared/app_colors.dart';
import 'package:my_news_app/ui/shared/ui_helpers.dart';
import 'package:my_news_app/ui/widgets/cards/news_card_one.dart';
import 'package:my_news_app/ui/widgets/cards/news_card_two.dart';

import '../shared/dummy_data.dart';
import '../widgets/buttons/square_icon_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // size contains the width and height of current screen.
    print("${size.height}");

    return Scaffold(
      backgroundColor: Colors.white,
      // we will not be using appbar, rather our own custom widgets, so
      // to avoid content going into the status bar, we will wrap our whole
      // screen with the SafeArea widget
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 10, 0, 0),
            child: ListView(
              children: [
                SizedBox(
                  width: size.width * 0.9,
                  height: 52,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SquareIconButton(
                          iconData: FontAwesomeIcons.linesLeaning,
                          onPress: () {},
                        ),
                        SquareIconButton(
                          iconData: FontAwesomeIcons.bell,
                          onPress: () {},
                        )
                      ],
                    ),
                  ),
                ),
                UIHelper.customVerticalSpace(24),
                Text(
                  "Welcome Back, Tyler!",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 26,
                    color: darkColor,
                  ),
                ),
                Text(
                  "Discover a world of news that matters to you",
                  style: GoogleFonts.sourceSans3(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: commonGreyColor,
                  ),
                ),
                UIHelper.customVerticalSpace(24),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: SizedBox(
                    height: 25,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Trending News",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: darkColor,
                          ),
                        ),
                        Text(
                          "See all",
                          style: GoogleFonts.sourceSans3(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: commonGreyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                UIHelper.customVerticalSpace(16),
                SizedBox(
                  height: 305,
                  width: double.infinity,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      print("printing item $index");
                      return NewsCardOne(
                        article: articles[index],
                      );
                    },
                    separatorBuilder: (context, index) =>
                        UIHelper.customHorizontalSpace(18),
                  ),
                ),
                UIHelper.customVerticalSpace(32),
                Text(
                  "Recommendation",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: darkColor,
                  ),
                ),
                UIHelper.customVerticalSpace(16),
                // we use spread operator, to list the recommended articles
                // from their data list into this listview
                ...recommendedArticles.map(
                  (article) => NewsCardTwo(
                    article: article,
                    size: size,
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
