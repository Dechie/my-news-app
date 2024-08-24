import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_news_app/ui/shared/app_colors.dart';

const headerStyle = TextStyle(
  fontSize: 35,
  fontWeight: FontWeight.w900,
);
final subHeaderStyle = GoogleFonts.sourceSans3(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: commonGreyColor,
);

/// returns googleFonts roboto with w500 fontwidth,
/// and 20 fontsize multiplied by either widthScale or heightScale
TextStyle robotoW500(double scale) {
  return GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 20 * scale,
    color: darkColor,
  );
}

/// returns source sans with  w400 and fontsize 18
/// multiplied by scale
TextStyle sourceSansW400A(double scale) {
  return GoogleFonts.sourceSans3(
    fontSize: 18 * scale,
    fontWeight: FontWeight.w400,
    color: commonGreyColor,
  );
}

/// returns source sans with  w400 and fontsize 16
/// multiplied by scale
TextStyle sourceSansW400B(double scale) {
  return GoogleFonts.sourceSans3(
    fontSize: 16 * scale,
    fontWeight: FontWeight.w400,
    color: commonGreyColor,
  );
}

/// returns source sans with  w400 and fontsize 18
/// multiplied by scale
TextStyle sourceSansW600A(double scale) {
  return GoogleFonts.sourceSans3(
    fontSize: 18 * scale,
    fontWeight: FontWeight.w600,
    color: commonGreyColor,
  );
}
