import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/app_colors.dart';

// this is another button with a grey-ish color,
// it has its own styling.
// for the sake of flexibiity in styling i have been using
// gesture detectors with container decoration in
// all the custom buttons.
class GreyButton extends StatelessWidget {
  /// this button is used in different places
  /// in [UserProfileView] page, [PublisherProfile] page and [HomeView] page.
  final void Function() onPress;

  final double width;
  final double height;
  final String text;
  final bool darkerButton;

  const GreyButton({
    super.key,
    required this.onPress,
    required this.width,
    required this.height,
    required this.text,
    this.darkerButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 9,
        ),
        decoration: BoxDecoration(
          /// dark color with 8 % opacity
          color: darkerButton ? darkColor2 : darkColor2.withOpacity(0.08),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              color: darkerButton ? Colors.white : darkColor,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
