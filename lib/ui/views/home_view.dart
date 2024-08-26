import 'package:flutter/material.dart';
import 'package:my_news_app/core/constants/enums.dart';
import 'package:my_news_app/core/models/user.dart';
import 'package:my_news_app/core/viewModels/home_v_model.dart';
import 'package:my_news_app/ui/shared/text_styles.dart';
import 'package:my_news_app/ui/shared/ui_helpers.dart';
import 'package:my_news_app/ui/views/base/base_view.dart';
import 'package:my_news_app/ui/widgets/bottom_nav_bar.dart';
import 'package:my_news_app/ui/widgets/cards/news_card_one.dart';
import 'package:my_news_app/ui/widgets/cards/news_card_two.dart';
import 'package:my_news_app/ui/widgets/skeletons/news_card_one_skeleton.dart';
import 'package:my_news_app/ui/widgets/skeletons/news_card_two_skeleton.dart';
import 'package:my_news_app/ui/widgets/titled_widget.dart';
import 'package:provider/provider.dart';

import '../shared/dummy_data.dart';
import '../widgets/buttons/square_svg_button.dart';

class HomeView extends StatelessWidget {
  DummyData data = DummyData();

  HomeView({super.key});

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

    /// we bind the home view model with the home
    /// view, now the state will be managed by that
    /// class.
    ///

    String userName = Provider.of<User>(context).name.split(" ").first;
    return BaseView<HomeVModel>(
      /// we abstracted the values needed for all views
      /// into base-view, now we use its values
      /// without having to convert this view class
      /// into a stateful widget.
      onModelReady: (viewModel) {
        viewModel.getTrending();
      },
      builder: (context, viewModel, child) {
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
                      title: "Welcome Back, $userName!",
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
                              viewModel.state == ViewState.busy
                                  ? "Loading..."
                                  : "See all",
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
                      child: viewModel.state == ViewState.busy

                          /// skeleton placeholder for when data is loading
                          ? NewsCardOneSkeleton(
                              heightScale: heightScale,
                              widthScale: widthScale,
                            )
                          : viewModel.state == ViewState.error

                              /// after viewModel has called api,
                              /// if any error had occurred
                              ? Center(
                                  child: Text(viewModel.error),
                                )

                              /// if actual data has loaded
                              : ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: viewModel.trendingArticles.length,
                                  itemBuilder: (context, index) {
                                    return NewsCardOne(
                                      widthScale: widthScale,
                                      heightScale: heightScale,
                                      article:
                                          viewModel.trendingArticles[index],
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      UIHelper.customHorizontalSpace(
                                          18 * widthScale),
                                ),
                    ),
                    UIHelper.customVerticalSpace(30 * heightScale),
                    viewModel.state == ViewState.busy
                        ? Text(
                            "Recommendations (Loading...)",
                            // this method comes from the text_styles file
                            style: robotoW500(widthScale),
                          )
                        : Text(
                            "Recommendation",
                            // this method comes from the text_styles file
                            style: robotoW500(widthScale),
                          ),
                    UIHelper.customVerticalSpace(16 * heightScale),
                    if (viewModel.state == ViewState.busy)
                      // if it is still loading
                      NewsCardTwoSkeleton(
                        size: size,
                        widthScale: widthScale,
                        heightScale: heightScale,
                      )
                    else if (viewModel.state == ViewState.idle)
                      // if it has loaded data
                      ...data.recommendedArticles.map(
                        // we use spread operator, to list the recommended articles
                        // from their data list into this listview
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
                      )
                    else if (viewModel.state == ViewState.error)
                      SizedBox(
                        width: 392 * widthScale,
                        height: 105 * heightScale,
                        child: Center(
                          child: Text(
                            viewModel.error,
                            style: sourceSansW400A(heightScale).copyWith(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
