import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/app_contstants.dart';
import '../shared/app_colors.dart';

class CommonButton extends StatelessWidget {
  final void Function() onPress;

  final double width;
  final double height;
  const CommonButton({
    super.key,
    required this.onPress,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: primaryBlue,
          borderRadius: BorderRadius.circular(commonBorderRadius),
        ),
        child: Center(
          child: Text(
            "Get Started",
            style: GoogleFonts.inter(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
