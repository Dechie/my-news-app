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
                SizedBox(
                  width: 392 * widthScale,
                  height: 257 * heightScale,
                  child: Row(
                    children: [
                      buildBookmarks(
                        heightScale,
                        widthScale,
                        "assets/images/trending_img1.jpg",
                        "assets/images/recommended_img1.jpg",
                        "assets/images/recommended_img1.jpg",
                      ),
                      UIHelper.customHorizontalSpace(12 * widthScale),
                      buildBookmarks(
                        heightScale,
                        widthScale,
                        "assets/images/athlete.jpg",
                        "assets/images/tennis.jpg",
                        "assets/images/car-trail.jpg",
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildBookmarks(
    double heightScale,
    double widthScale,
    String image1,
    String image2,
    String image3,
  ) {
    // return Column(
    //   children: [
    //     SizedBox(
    //       width: 190 * heightScale,
    //       height: 190 * heightScale,
    //       child: DecoratedBox(
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(10),
    //           color: newsCardBg,
    //         ),
    //         child: Column(
    //           children: [
    //             SizedBox(
    //               height: 109 * heightScale,
    //               width: 190 * widthScale,
    //               child: DecoratedBox(
    //                 decoration: BoxDecoration(
    //                   image: DecorationImage(
    //                     image: AssetImage(image1),
    //                     fit: BoxFit.cover,
    //                   ),
    //                   borderRadius: const BorderRadius.only(
    //                     topLeft: Radius.circular(10),
    //                     topRight: Radius.circular(10),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             UIHelper.customVerticalSpace(2),
    //             SizedBox(
    //               height: 190 * heightScale,
    //               width: 190 * widthScale,
    //               child: DecoratedBox(
    //                 decoration: const BoxDecoration(
    //                   borderRadius: BorderRadius.only(
    //                     bottomLeft: Radius.circular(10),
    //                     bottomRight: Radius.circular(10),
    //                   ),
    //                 ),
    //                 child: SizedBox(
    //                   width: 190 * widthScale,
    //                   height: 98 * heightScale,
    //                   child: Row(
    //                     children: [
    //                       SizedBox(
    //                         width: 94 * widthScale,
    //                         height: 79 * heightScale,
    //                         child: Image.asset(image2),
    //                       ),
    //                       UIHelper.customHorizontalSpace(2),
    //                       SizedBox(
    //                         width: 94 * widthScale,
    //                         height: 79 * heightScale,
    //                         child: Image.asset(
    //                           image3,
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ],
    // );
    return Column(
      children: [
        SizedBox(
          width: 190 * heightScale,
          height: 190 * heightScale,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: newsCardBg,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 109 * heightScale,
                  width: 190 * widthScale,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(image1),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                UIHelper.customVerticalSpace(2),
                Expanded(
                  child: SizedBox(
                    width: 190 * widthScale,
                    height: 98 * heightScale,
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: 94 * widthScale,
                            height: 79 * heightScale,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(image2),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        UIHelper.customHorizontalSpace(2),
                        Expanded(
                          child: SizedBox(
                            width: 94 * widthScale,
                            height: 79 * heightScale,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(image3),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
