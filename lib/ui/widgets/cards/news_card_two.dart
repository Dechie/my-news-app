import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_news_app/ui/shared/app_colors.dart';
import 'package:my_news_app/ui/shared/text_styles.dart';
import 'package:my_news_app/ui/shared/ui_helpers.dart';
import 'package:my_news_app/ui/widgets/buttons/grey_button.dart';

import '../../../core/models/article.dart';
import '../rounded_rect_image.dart';

// this widget holds the card for recommended
// news in the homepage view/screen.
// it takes an article as an argument.
class NewsCardTwo extends StatelessWidget {
  final Article article;
  // current article data

  final Size size;
  // we pass in the dimensions of the current screen
  // because we need it in later on

  const NewsCardTwo({
    super.key,
    required this.article,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18.0, bottom: 10),
      child: SizedBox(
        width: double.infinity,
        height: 404,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: newsCardBg,
            //color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 46,
                  width: double.infinity,
                  child: Row(
                    children: [
                      // tiny logo of the publisher company
                      RoundedRectImage(
                        width: 36,
                        height: 36,
                        borderRadius: 4,
                        imagePath:
                            "assets/logos/${article.publisherAgency.logo}",
                      ),
                      UIHelper.customHorizontalSpace(22),
                      SizedBox(
                        height: 46,
                        width: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              article.publisherAgency.sourceTitle,
                              style: subHeaderStyle,
                            ),
                            Text(
                              article.date,
                              style: subHeaderStyle,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      GreyButton(
                        onPress: () {},
                        width: 91,
                        height: 37,
                        text: "Follow",
                      ),
                      UIHelper.customHorizontalSpace(14),
                      // 3 dots button on the top right
                      GestureDetector(
                        onTap: () {},
                        child: const RoundedRectImage(
                          width: 24,
                          height: 24,
                          borderRadius: 0,
                          imagePath: "assets/images/three_dots.png",
                        ),
                      ),
                    ],
                  ),
                ),
                UIHelper.customVerticalSpace(15),
                Text(
                  "Tech Startup Secures \$50 Million Funding for Expansion",
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: darkColor,
                  ),
                ),
                UIHelper.customVerticalSpace(8),
                SizedBox(
                  width: 73,
                  height: 30,
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
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: lighterBlue,
                        ),
                      ),
                    ),
                  ),
                ),
                UIHelper.customHorizontalSpace(16),
                RoundedRectImage(
                  width: size.width * 0.84,
                  height: 198,
                  borderRadius: 10,
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
