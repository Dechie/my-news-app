// since the figma design dimensions turn out to be
// larger than usual mobile phone dimensions, we will scale it
// to given screen size, and multiply every thing with that scale.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_news_app/core/constants/app_contstants.dart';
import 'package:my_news_app/core/viewModels/discover_v_model.dart';
import 'package:my_news_app/ui/shared/ui_helpers.dart';
import 'package:my_news_app/ui/widgets/bottom_nav_bar.dart';
import 'package:my_news_app/ui/widgets/publisher_icon.dart';
import 'package:my_news_app/ui/widgets/skeletons/publisher_icon_skeleton.dart';

import '../../core/constants/enums.dart';
import '../shared/app_colors.dart';
import '../shared/text_styles.dart';
import '../widgets/cards/news_card_two.dart';
import '../widgets/search_bar.dart';
import '../widgets/skeletons/news_card_two_skeleton.dart';
import 'base/base_view.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var widthScale = size.width / 428;
    var heightScale = size.height / 926;

    return BaseView<DiscoverVModel>(
      onModelReady: (viewModel) {
        viewModel.getAllArticles();
        viewModel.getNewsAgencies();
        viewModel.getRecommended();
      },
      builder: (context, viewModel, child) {
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
                      child: viewModel.state == ViewState.busy
                          ? ListView.separated(
                              /// if it is still loading, show
                              /// 3 skeleton widgets with shimmer effect
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, index) {
                                return PublisherIconSkeleton(
                                  height: 167 * heightScale,
                                  width: 147 * widthScale,
                                  widthScale: widthScale,
                                  heightScale: heightScale,
                                );
                              },
                              separatorBuilder: (_, index) =>
                                  UIHelper.customHorizontalSpace(10),
                              itemCount: 3,
                            )

                          /// if data has loaded, show the actual
                          /// list of news agencies/publishers.
                          : ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: viewModel.newsAgencies.length,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    RoutePaths.singlePublisher,
                                    arguments: viewModel.newsAgencies[index],
                                  );
                                },
                                child: PublisherIcon(
                                  height: 167 * heightScale,
                                  width: 147 * widthScale,
                                  widthScale: widthScale,
                                  heightScale: heightScale,
                                  publisher: viewModel.newsAgencies[index],
                                ),
                              ),
                              separatorBuilder: (context, index) =>
                                  UIHelper.customHorizontalSpace(10),
                            ),
                    ),
                    UIHelper.getVerticalSpaceLarge(size),
                    Text(
                      "News",
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
                              viewModel.setNewsTypesIndex(index);
                            },
                            child: Text(
                              viewModel.newsTypes[index],
                              style: GoogleFonts.sourceSans3(
                                color: viewModel.newsTypesIndex == index
                                    ? lighterBlue
                                    : commonGreyColor,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    UIHelper.customVerticalSpace(14),
                    if (viewModel.state == ViewState.busy)
                      NewsCardTwoSkeleton(
                        size: size,
                        heightScale: heightScale,
                        widthScale: widthScale,
                      ),
                    if (viewModel.newsTypesIndex == 0)
                      ...viewModel.allArticles.map(
                        (article) {
                          return NewsCardTwo(
                            widthScale: widthScale,
                            heightScale: heightScale,
                            article: article,
                            size: size,
                          );
                        },
                      ),
                    if (viewModel.newsTypesIndex == 1 &&
                        viewModel.recommendedArticles.isNotEmpty)
                      ...viewModel.recommendedArticles.map(
                        (article) {
                          return NewsCardTwo(
                            widthScale: widthScale,
                            heightScale: heightScale,
                            article: article,
                            size: size,
                          );
                        },
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
