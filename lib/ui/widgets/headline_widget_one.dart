import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_news_app/ui/shared/app_colors.dart';
import 'package:my_news_app/ui/shared/text_styles.dart';
import 'package:my_news_app/ui/shared/ui_helpers.dart';

import '../../core/models/article.dart';

class NewsCardOne extends StatelessWidget {
  final Article article;

  const NewsCardOne({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 301,
      height: 305,
      child: DecoratedBox(
        decoration: const BoxDecoration(color: newsCardBg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: 285,
                  height: 161,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/${article.image}",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 18,
                  left: 18, // parent widget's difference added to 18
                  child: SizedBox(
                    height: 27,
                    width: 84,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: lighterBlue,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 6),
                        child: Text(
                          textAlign: TextAlign.center,
                          article.category,
                          style: subHeaderStyle.copyWith(
                            fontSize: 12,
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
            UIHelper.customVerticalSpace(12),
            SizedBox(
              height: 72,
              width: 269,
              child: Text(
                article.title,
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  color: darkColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            UIHelper.customVerticalSpace(12),
            SizedBox(
              width: 301,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    const Icon(FontAwesomeIcons.newspaper),
                    UIHelper.customHorizontalSpace(5),
                    Text(
                      article.publisherAgency?.sourceTitle ??
                          "error source title",
                      style: subHeaderStyle,
                    ),
                    const Spacer(),
                    UIHelper.customHorizontalSpace(5),
                    Text(
                      article.date,
                      style: subHeaderStyle,
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
