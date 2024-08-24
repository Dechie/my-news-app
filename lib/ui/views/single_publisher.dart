import 'package:flutter/material.dart';
import 'package:my_news_app/core/models/news_agency.dart';

import '../widgets/buttons/square_icon_button.dart';

class SinglePublisherView extends StatelessWidget {
  final NewsAgency? publisher;

  const SinglePublisherView({
    super.key,
    this.publisher,
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
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0.0),
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
                        SquareIconButton(
                          widthScale: widthScale,
                          heightScale: heightScale,
                          iconPath: "arrow_left.svg",
                          onPress: () {},
                        ),
                        SquareIconButton(
                          widthScale: widthScale,
                          heightScale: heightScale,
                          iconPath: "menu.svg",
                          onPress: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                Text("${publisher?.sourceTitle} ?? publisher")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
