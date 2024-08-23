import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_news_app/ui/shared/app_colors.dart';
import 'package:my_news_app/ui/shared/text_styles.dart';
import 'package:my_news_app/ui/shared/ui_helpers.dart';
import 'package:my_news_app/ui/widgets/rounded_rect_image.dart';

import '../../../core/models/article.dart';

class NewsCardOne extends StatelessWidget {
  final Article article;

  final double heightScale, widthScale;
  const NewsCardOne({
    super.key,
    required this.article,
    required this.heightScale,
    required this.widthScale,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 301,
      height: 305 * heightScale,
      child: DecoratedBox(
        decoration: const BoxDecoration(color: newsCardBg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                RoundedRectImage(
                  width: 285,
                  height: 161 * heightScale,
                  borderRadius: 8,
                  imagePath: "assets/images/${article.image}",
                ),
                Positioned(
                  top: 18 * heightScale,
                  left:
                      18 * widthScale, // parent widget's difference added to 18
                  child: SizedBox(
                    height: 27 * heightScale,
                    width: 90 * heightScale,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: lighterBlue,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8 * widthScale,
                          vertical: 6 * heightScale,
                        ),
                        child: Text(
                          textAlign: TextAlign.center,
                          article.category,
                          style: subHeaderStyle.copyWith(
                            fontSize: 12 * widthScale,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            UIHelper.customVerticalSpace(12 * heightScale),
            SizedBox(
              height: 75 * heightScale,
              width: 269 * widthScale,
              child: Text(
                article.title,
                style: GoogleFonts.roboto(
                  fontSize: 17 * heightScale,
                  color: darkColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            UIHelper.customVerticalSpace(8 * heightScale),
            SizedBox(
              width: 301 * heightScale,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0 * widthScale),
                child: Row(
                  children: [
                    RoundedRectImage(
                      // multiply same number to preserve square shape
                      width: 36 * heightScale,
                      height: 36 * heightScale,
                      borderRadius: 4,
                      imagePath: "assets/logos/${article.publisherAgency.logo}",
                    ),
                    UIHelper.customHorizontalSpace(5),
                    Text(
                      article.publisherAgency.sourceTitle,
                      style: subHeaderStyle.copyWith(
                        fontSize: 16 * heightScale,
                      ),
                    ),
                    const Spacer(),
                    UIHelper.customHorizontalSpace(5),
                    Text(
                      article.date,
                      style:
                          subHeaderStyle.copyWith(fontSize: 16 * heightScale),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
