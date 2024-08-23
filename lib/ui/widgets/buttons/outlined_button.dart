import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/app_contstants.dart';
import '../../shared/app_colors.dart';

class MyOutlinedButton extends StatelessWidget {
  final void Function() onPress;

  final double width;
  final double height;
  final String text;
  final String imagePath;
  const MyOutlinedButton({
    super.key,
    required this.onPress,
    required this.width,
    required this.height,
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(commonBorderRadius),
          border: Border.all(
            color: commonGreyColor,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logos/$imagePath",
              width: 18,
              height: 18,
            ),
            const Spacer(),
            Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: darkColor,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
