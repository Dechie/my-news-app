import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_news_app/core/models/news_agency.dart';
import 'package:my_news_app/ui/shared/text_styles.dart';
import 'package:my_news_app/ui/shared/ui_helpers.dart';
import 'package:my_news_app/ui/widgets/main_profile_details.dart';
import 'package:my_news_app/ui/widgets/search_bar.dart';

import '../shared/app_colors.dart';
import '../widgets/buttons/square_svg_button.dart';
import '../widgets/cards/news_card_two.dart';
import '../widgets/titled_widget.dart';

class SinglePublisherView extends StatelessWidget {
  final NewsAgency publisher;

  const SinglePublisherView({
    super.key,
    required this.publisher,
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
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0.0),
            child: ListView(
              children: [
                SizedBox(
                  width: size.width * 0.9,
                  height: 52 * heightScale,
                  child: Padding(
                    padding: EdgeInsets.only(right: 18.0 * widthScale),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SquareSVGButton(
                          widthScale: widthScale,
                          heightScale: heightScale,
                          iconPath: "arrow_left.svg",
                          onPress: () {
                            Navigator.pop(context);
                          },
                        ),
                        UIHelper.customHorizontalSpace(14 * widthScale),
                        Text(
                          publisher.sourceUsername ?? "source",
                          style: robotoW500(widthScale),
                        ),
                        const Spacer(),
                        SquareSVGButton(
                          widthScale: widthScale,
                          heightScale: heightScale,
                          iconPath: "three_dots.svg",
                          onPress: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                UIHelper.customVerticalSpace(24),
                MainProfileDetails(
                  widthScale: widthScale,
                  heightScale: heightScale,
                  newsAgency: publisher,
                  profileType: ProfileType.newsAgency,
                ),
                UIHelper.customVerticalSpace(32),
                TitledWidget(
                  width: 392 * widthScale,
                  height: 94 * heightScale,
                  widthScale: widthScale,
                  heightScale: heightScale,
                  title: publisher.sourceTitle,
                  subtitle: publisher.description,
                ),
                UIHelper.customVerticalSpace(32 * heightScale),
                SizedBox(
                  width: 391 * widthScale,
                  height: 63 * heightScale,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "News By ${publisher.sourceTitle}",
                        style: robotoW500(heightScale),
                      ),
                      SizedBox(
                        height: 25,
                        width: 392 * widthScale,
                        child: Row(
                          children: [
                            Text(
                              "Sort by:",
                              style: sourceSansW400A(heightScale),
                            ),
                            UIHelper.customHorizontalSpace(3),

                            /// dropdown button with static drop down values
                            DropdownButton(
                              value: "Newest",
                              icon: SvgPicture.asset(
                                "assets/svgs/arrow_down.svg",
                              ),
                              dropdownColor: Colors.white,
                              items:
                                  <String>["Newest", "trending", "Recommended"]
                                      .map(
                                        (String e) => DropdownMenuItem(
                                          value: e,
                                          child: (Text(
                                            e,
                                            style: sourceSansW400A(heightScale)
                                                .copyWith(color: darkColor),
                                          )),
                                        ),
                                      )
                                      .toList(),
                              onChanged: (value) {},
                            ),
                            const Spacer(),
                            SvgPicture.asset("assets/svgs/square_group.svg"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                UIHelper.customVerticalSpace(10),
                CustomSearchBar(
                  widthScale: widthScale,
                  heightScale: heightScale,
                ),
                UIHelper.customVerticalSpace(10),

                /// if the publisher news agency has no articles, show centered text that says
                /// they have no articles so far
                if (publisher.articlesPublished.isEmpty)
                  SizedBox(
                    height: 407 * heightScale,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "No News from ${publisher.sourceTitle}",
                        style: sourceSansW400B(widthScale),
                      ),
                    ),
                  ),

                /// if publisher news agency has articles, list its articles with the article
                /// cards using spread operator in this listview
                if (publisher.articlesPublished.isEmpty)
                  ...publisher.articlesPublished.map(
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
}
