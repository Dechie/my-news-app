import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Contains useful consts to reduce boilerplate and duplicate code
class UIHelper {
  // Vertical spacing constants. Adjust to your liking.
  static const double _VerticalSpaceSmall = 10.0;
  static const double _VerticalSpaceMedium = 40.0;
  static const double _VerticalSpaceLarge = 72.0;

  // Vertical spacing constants. Adjust to your liking.
  static const double _HorizontalSpaceSmall = 10.0;
  static const double _HorizontalSpaceMedium = 40.0;
  static const double _HorizontalSpaceLarge = 60.0;

  static const Widget verticalSpaceSmall =
      SizedBox(height: _VerticalSpaceSmall);
  static const Widget verticalSpaceMedium =
      SizedBox(height: _VerticalSpaceMedium);
  static const Widget verticalSpaceLarge =
      SizedBox(height: _VerticalSpaceLarge);

  static const Widget horizontalSpaceSmall =
      SizedBox(width: _HorizontalSpaceSmall);
  static const Widget horizontalSpaceMedium =
      SizedBox(width: _HorizontalSpaceMedium);
  static const Widget horizontalSpaceLarge =
      SizedBox(width: _HorizontalSpaceLarge);
  static Widget tinyRedStar = Container(
    width: 34.46,
    height: 32.09,
    decoration: const ShapeDecoration(
      color: starColorRed,
      shape: StarBorder(
        valleyRounding: 1,
        innerRadiusRatio: 0.15,
        points: 4,
      ),
    ),
  );

  static getHorizontalSpaceMedium(Size size) => SizedBox(
        width: size.width * 0.049,
      );

  static Widget getVerticalSpaceLarge(Size size) => SizedBox(
        height: size.height * 0.073,
      );

  static Widget getVerticalSpaceMedium(Size size) => SizedBox(
        height: size.height * 0.039,
      );
}
