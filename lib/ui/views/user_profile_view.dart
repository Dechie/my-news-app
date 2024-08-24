import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_news_app/ui/shared/app_colors.dart';
import 'package:my_news_app/ui/shared/text_styles.dart';
import 'package:my_news_app/ui/shared/ui_helpers.dart';
import 'package:my_news_app/ui/widgets/bottom_nav_bar.dart';
import 'package:my_news_app/ui/widgets/buttons/square_svg_button.dart';
import 'package:my_news_app/ui/widgets/main_profile_details.dart';
import 'package:my_news_app/ui/widgets/titled_widget.dart';

import '../../core/models/user.dart';
import '../widgets/cards/news_card_two.dart';

class UserProfileView extends StatelessWidget {
  final User user;
  const UserProfileView({
    super.key,
    required this.user,
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
      bottomNavigationBar: const BottomNavyBar(selectedIndex: 3),
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
                      TitledWidget(
                        width: 123 * widthScale,
                        height: 59,
                        widthScale: widthScale,
                        heightScale: heightScale,
                        title: "Profile",
                        subtitle: user.username,
                      ),
                      // svg settings button
                      SquareSVGButton(
                        widthScale: widthScale,
                        heightScale: heightScale,
                        onPress: () {},
                        iconPath: "settings.svg",
                      )
                    ],
                  ),
                ),
                UIHelper.customVerticalSpace(32 * heightScale),

                /// main details of the user using the custom details widget
                MainProfileDetails(
                  widthScale: widthScale,
                  heightScale: heightScale,
                  user: user,
                  profileType: ProfileType.user,
                ),
                UIHelper.customVerticalSpace(32 * heightScale),
                TitledWidget(
                  width: 392 * widthScale,
                  height: 70 * heightScale,
                  widthScale: widthScale,
                  heightScale: heightScale,
                  title: user.name,
                  subtitle: user.description,
                ),
                UIHelper.customVerticalSpace(32 * heightScale),
                SizedBox(
                  width: 391 * widthScale,
                  height: 63 * heightScale,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your news",
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

                /// if user has no articles, show centered text that says
                /// you have no articles so far
                if (user.articlesPublished.isEmpty)
                  SizedBox(
                    height: 407 * heightScale,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "You don’t have any news, make some.",
                        style: sourceSansW400B(widthScale),
                      ),
                    ),
                  ),

                /// but if user has articles, list its articles with the article
                /// cards using spread operator in this listview
                if (user.articlesPublished.isEmpty)
                  ...user.articlesPublished.map(
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
