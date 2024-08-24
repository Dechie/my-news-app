import 'package:flutter/material.dart';
import 'package:my_news_app/ui/shared/text_styles.dart';
import 'package:my_news_app/ui/shared/ui_helpers.dart';
import 'package:my_news_app/ui/widgets/bottom_nav_bar.dart';
import 'package:my_news_app/ui/widgets/cards/news_card_one.dart';
import 'package:my_news_app/ui/widgets/cards/news_card_two.dart';
import 'package:my_news_app/ui/widgets/titled_widget.dart';

import '../shared/dummy_data.dart';
import '../widgets/buttons/square_svg_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  DummyData data = DummyData();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // size contains the width and height of current screen.
    print("${size.height}");

    // since the figma design dimensions turn out to be
    // larger than usual mobile phone dimensions, we will scale it
    // to given screen size, and multiply every thing with that scale.
    var widthScale = size.width / 428;
    var heightScale = size.height / 926;
    print("widthscale: $widthScale, heightscale: $heightScale");
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const BottomNavyBar(
        selectedIndex: 0,
      ),
      body: SafeArea(
        // we will not be using appbar, rather our own custom widgets, so
        // to avoid content going into the status bar, we will wrap our whole
        // screen with the SafeArea widget
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0, top: 10),
            child: ListView(
              children: [
                SizedBox(
                  width: size.width * 0.9,
                  height: 52 * heightScale,
                  child: Padding(
                    padding: EdgeInsets.only(right: 18.0 * widthScale),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SquareSVGButton(
                          widthScale: widthScale,
                          heightScale: heightScale,
                          iconPath: "menu.svg",
                          onPress: () {},
                        ),
                        SquareSVGButton(
                          widthScale: widthScale,
                          heightScale: heightScale,
                          iconPath: "notification_bell.svg",
                          onPress: () {},
                        )
                      ],
                    ),
                  ),
                ),
                UIHelper.customVerticalSpace(24 * heightScale),
                TitledWidget(
                  width: 329 * widthScale,
                  height: 63 * heightScale,
                  widthScale: widthScale,
                  heightScale: heightScale,
                  title: "Welcome Back, Tyler!",
                  subtitle: "Discover a world of news that matters to you",
                ),

                UIHelper.customVerticalSpace(24 * heightScale),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: SizedBox(
                    height: 26 * heightScale,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Trending News",

                          /// this method comes from the text_styles file
                          style: robotoW500(heightScale),
                        ),
                        Text(
                          "See all",
                          style: sourceSansW400B(widthScale),
                        ),
                      ],
                    ),
                  ),
                ),
                UIHelper.customVerticalSpace(16 * heightScale),
                SizedBox(
                  height: 305 * heightScale,
                  width: double.infinity,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.trendingArticles.length,
                    itemBuilder: (context, index) {
                      return NewsCardOne(
                        widthScale: widthScale,
                        heightScale: heightScale,
                        // TODO: implement provider
                        article: data.trendingArticles[index],
                      );
                    },
                    separatorBuilder: (context, index) =>
                        UIHelper.customHorizontalSpace(18 * widthScale),
                  ),
                ),
                UIHelper.customVerticalSpace(30 * heightScale),
                Text(
                  "Recommendation",
                  // this method comes from the text_styles file
                  style: robotoW500(widthScale),
                ),
                UIHelper.customVerticalSpace(16 * heightScale),
                // we use spread operator, to list the recommended articles
                // from their data list into this listview
                // TODO: implement provider
                ...data.recommendedArticles.map(
                  (article) {
                    print(
                        "title: ${article.title}, id: ${article.id}, publisher: ${article.publisherAgency?.sourceTitle ?? "eror source title"}");
                    return NewsCardTwo(
                      widthScale: widthScale,
                      heightScale: heightScale,
                      article: article,
                      size: size,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
