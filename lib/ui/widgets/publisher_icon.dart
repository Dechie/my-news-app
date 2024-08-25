import 'package:flutter/material.dart';
import 'package:my_news_app/core/models/news_agency.dart';

import '../shared/text_styles.dart';
import '../shared/ui_helpers.dart';
import 'buttons/grey_button.dart';
import 'rounded_rect_image.dart';

class PublisherIcon extends StatelessWidget {
  final double height, width, widthScale, heightScale;

  final NewsAgency publisher;
  const PublisherIcon({
    super.key,
    required this.height,
    required this.width,
    required this.widthScale,
    required this.heightScale,
    required this.publisher,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 167 * heightScale,
      width: 147 * widthScale,
      child: Column(
        children: [
          Hero(
            tag: publisher.id,
            child: RoundedRectImage(
              width: 60 * heightScale,
              height: 60 * heightScale,
              borderRadius: 6,
              imagePath: "assets/logos/${publisher.logo}",
            ),
          ),
          UIHelper.customVerticalSpace(8 * heightScale),
          Text(
            publisher.sourceTitle,
            style: sourceSansW600A(heightScale),
          ),
          UIHelper.customVerticalSpace(16 * heightScale),
          GreyButton(
            onPress: () {},
            width: 115 * widthScale,
            height: 34 * heightScale,
            text: "Follow",
          ),
        ],
      ),
    );
  }
}
