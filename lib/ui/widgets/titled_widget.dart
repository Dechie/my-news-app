import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          Text(
            title,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w600,
              fontSize: 26 * heightScale,
              color: darkColor,
            ),
          ),
          Text(
            subtitle,
            style: GoogleFonts.sourceSans3(
              fontSize: 18 * heightScale,
              fontWeight: FontWeight.w400,
              color: commonGreyColor,
            ),
          ),
        ],
      ),
    );
  }
}
