import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_news_app/ui/shared/app_colors.dart';
import 'package:my_news_app/ui/shared/text_styles.dart';
import 'package:my_news_app/ui/shared/ui_helpers.dart';
import 'package:my_news_app/ui/widgets/buttons/grey_button.dart';

import '../../../core/constants/app_contstants.dart';
import '../../../core/models/article.dart';
import '../rounded_rect_image.dart';

// this widget holds the card for recommended
// news in the homepage view/screen.
// it takes an article as an argument.
class NewsCardTwo extends StatelessWidget {
  // current article data
  final Article article;

  // we pass in the dimensions of the current screen
  // because we need it in later on
  final Size size;

  // the scale of the device in proportion to the figma design
  // this is because the design assumes a bigger screen size than
  // normal phones.
  final double widthScale;
  final double heightScale;

  const NewsCardTwo({
    super.key,
    required this.article,
    required this.size,
    required this.widthScale,
    required this.heightScale,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18.0, bottom: 10),
      child: SizedBox(
        width: double.infinity,
        height: 407 * heightScale,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: newsCardBg,
            //color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16 * heightScale,
              vertical: 12 * widthScale,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 51 * heightScale,
                  width: double.infinity,
                  child: Row(
                    children: [
                      // tiny logo of the publisher company
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            RoutePaths.singlePublisher,
                            arguments: article.publisherAgency,
                          );
                        },
                        child: RoundedRectImage(
                          // multiply by same scale value to preserve
                          // square shape
                          width: 36 * heightScale,
                          height: 36 * heightScale,
                          borderRadius: 4,
                          // the image of the publisher company
                          imagePath:
                              "assets/logos/${article.publisherAgency.logo}",
                        ),
                      ),
                      UIHelper.customHorizontalSpace(20 * widthScale),
                      SizedBox(
                        height: 52 * heightScale,
                        width: 100 * widthScale,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  RoutePaths.singlePublisher,
                                  arguments: article.publisherAgency,
                                );
                              },
                              child: SizedBox(
                                height: 25 * heightScale,
                                width: 100 * widthScale,
                                child: Row(
                                  children: [
                                    Text(
                                      article.publisherAgency.sourceTitle,
                                      style: subHeaderStyle.copyWith(
                                        fontSize: 15 * heightScale,
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      "assets/svgs/verified_badge.svg",
                                      width: 18,
                                      height: 18,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              article.date,
                              style: subHeaderStyle.copyWith(
                                fontSize: 15 * heightScale,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      GreyButton(
                        onPress: () {},
                        width: 91 * widthScale,
                        height: 37 * heightScale,
                        text: "Follow",
                      ),
                      UIHelper.customHorizontalSpace(14 * widthScale),
                      // 3 dots button on the top right
                      GestureDetector(
                        onTap: () {},
                        child: RoundedRectImage(
                          // multiply by same number to preserve square shape
                          width: 24 * heightScale,
                          height: 24 * heightScale,
                          borderRadius: 0,
                          imagePath: "assets/images/three_dots.png",
                        ),
                      ),
                    ],
                  ),
                ),
                UIHelper.customVerticalSpace(15 * heightScale),
                Text(
                  article.title,
                  style: GoogleFonts.roboto(
                    fontSize: 20 * heightScale,
                    fontWeight: FontWeight.w700,
                    color: darkColor,
                  ),
                ),
                UIHelper.customVerticalSpace(8 * heightScale),
                SizedBox(
                  width: 73 * widthScale,
                  height: 30 * heightScale,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: lighterBlue,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        article.category,
                        style: GoogleFonts.sourceSans3(
                          fontSize: 14 * heightScale,
                          fontWeight: FontWeight.w600,
                          color: lighterBlue,
                        ),
                      ),
                    ),
                  ),
                ),
                UIHelper.customVerticalSpace(16 * heightScale),
                RoundedRectImage(
                  // width already depends on screen value so no need for
                  // widthScale value.
                  width: size.width * 0.84,
                  height: 198 * heightScale,
                  borderRadius: 10 * heightScale,
                  imagePath: "assets/images/${article.image}",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
