import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_news_app/ui/shared/app_colors.dart';
import 'package:my_news_app/ui/shared/text_styles.dart';
import 'package:my_news_app/ui/shared/ui_helpers.dart';
import 'package:my_news_app/ui/widgets/buttons/grey_button.dart';

import '../../../core/models/article.dart';
import '../company_logo.dart';

class NewsCardTwo extends StatelessWidget {
  final Article article;

  const NewsCardTwo({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 404,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: newsCardBg,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              SizedBox(
                height: 46,
                width: double.infinity,
                child: Row(
                  children: [
                    RoundedRectImage(
                      width: 36,
                      height: 36,
                      borderRadius: 4,
                      imagePath: "assets/logos/${article.newsAgency.logo}",
                    ),
                    UIHelper.customHorizontalSpace(22),
                    SizedBox(
                      height: 46,
                      width: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            article.newsAgency.sourceTitle,
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
