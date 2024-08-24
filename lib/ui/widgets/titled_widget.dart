import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_news_app/ui/shared/text_styles.dart';

import '../shared/app_colors.dart';

class TitledWidget extends StatelessWidget {
  final double width, height, widthScale, heightScale;
  final String title, subtitle;
  const TitledWidget({
    super.key,
    required this.width,
    required this.height,
    required this.widthScale,
    required this.heightScale,
    required this.title,
    required this.subtitle,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: 24 * heightScale,
                color: darkColor,
              ),
            ),
          ),
          Expanded(
            child: Text(
              subtitle,
              style: sourceSansW400A(heightScale),
            ),
          ),
        ],
      ),
    );
  }
}
