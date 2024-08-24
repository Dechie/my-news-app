// since the figma design dimensions turn out to be
// larger than usual mobile phone dimensions, we will scale it
// to given screen size, and multiply every thing with that scale.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_news_app/core/constants/app_contstants.dart';
import 'package:my_news_app/core/models/article.dart';
import 'package:my_news_app/ui/shared/dummy_data.dart';
import 'package:my_news_app/ui/shared/ui_helpers.dart';
import 'package:my_news_app/ui/widgets/bottom_nav_bar.dart';
import 'package:my_news_app/ui/widgets/rounded_rect_image.dart';

import '../shared/app_colors.dart';
import '../shared/text_styles.dart';
import '../widgets/buttons/grey_button.dart';
import '../widgets/cards/news_card_two.dart';
import '../widgets/search_bar.dart';

class DiscoverView extends StatefulWidget {
  const DiscoverView({super.key});

  @override
  State<DiscoverView> createState() => _DiscoverViewState();
}

class _DiscoverViewState extends State<DiscoverView> {
  TextEditingController searchCtrl = TextEditingController();
  DummyData data = DummyData();
  List<String> newsTypes = [
    "All",
    "Recommended",
    "Popular",
    "Most Visited",
    "Trending"
  ];

  int newsTypesIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // since the figma design dimensions turn out to be
    // larger than usual mobile phone dimensions, we will scale it
    // to given screen size, and multiply every thing with that scale.
    var widthScale = size.width / 428;
    var heightScale = size.height / 926;
    // TODO: implement provider
    List<Article> allArticles = [
      ...data.trendingArticles,
      ...data.recommendedArticles,
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const BottomNavyBar(selectedIndex: 1),
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 0.0, 0.0),
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
                  // this method comes from text_styles file
                  style: sourceSansW400A(widthScale),
                ),
                UIHelper.customVerticalSpace(14 * heightScale),
                CustomSearchBar(
                  widthScale: widthScale,
                  heightScale: heightScale,
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
                          "Publishers",
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
                UIHelper.customVerticalSpace(13 * heightScale),
                SizedBox(
                  height: 167 * heightScale,
                  width: double.infinity,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.newsAgencies.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          RoutePaths.singlePublisher,
                          arguments: data.newsAgencies[index],
                        );
                      },
                      child: SizedBox(
                        height: 167 * heightScale,
                        width: 147 * widthScale,
                        child: Column(
                          children: [
                            Hero(
                              tag: data.newsAgencies[index].id,
                              child: RoundedRectImage(
                                width: 60 * heightScale,
                                height: 60 * heightScale,
                                borderRadius: 6,
                                // TODO: implement provider
                                imagePath:
                                    "assets/logos/${data.newsAgencies[index].logo}",
                              ),
                            ),
                            UIHelper.customVerticalSpace(8 * heightScale),
                            Text(
                              // TODO: IMPLEMENT PROVIDER
                              data.newsAgencies[index].sourceTitle,
                              // this method comes from text_styles file
                              style: sourceSansW600A(heightScale),
                            ),
                            UIHelper.customVerticalSpace(16 * heightScale),
                            GreyButton(
                              onPress: () {},
                              width: 115 * widthScale,
                              height: 34 * heightScale,
                              text: "Follow",
                            ),
                          ],
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) =>
                        UIHelper.customHorizontalSpace(10),
                  ),
                ),
                UIHelper.getVerticalSpaceLarge(size),
                Text(
                  "News",

                  /// this method comes from the text_styles file
                  style: robotoW500(heightScale),
                ),
                UIHelper.customVerticalSpace(16 * heightScale),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (_, index) {
                      return TextButton(
                        onPressed: () {
                          setState(() {
                            newsTypesIndex = index;
                          });
                        },
                        child: Text(
                          newsTypes[index],
                          style: GoogleFonts.sourceSans3(
                            color: newsTypesIndex == index
                                ? lighterBlue
                                : commonGreyColor,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                UIHelper.customVerticalSpace(14),

                /// if current value (of listview tabs just above) is of all articles, return this one.
                if (newsTypesIndex == 0)
                  ...allArticles.map(
                    (article) {
                      return NewsCardTwo(
                        widthScale: widthScale,
                        heightScale: heightScale,
                        article: article,
                        size: size,
                      );
                    },
                  ),

                /// if current value  (of listview tabs just above)is recommended ones, return this one.
                // TODO: Implement provider
                ...data.recommendedArticles.map(
                  (article) {
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

  void onSearchPressed(String current) {}
}
