import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_news_app/ui/shared/app_colors.dart';

class LoginTextField extends StatelessWidget {
  final double width, height;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final String hintText;

  const LoginTextField({
    super.key,
    required this.width,
    required this.height,
    required this.prefixIcon,
    required this.hintText,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: inputDecorationFill,
      width: width,
      height: height,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.sourceSans3(
            color: commonGreyColor,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: inputDecorationFill,
              width: 1.0,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: inputDecorationFill,
              width: 1.0,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: inputDecorationFill,
              width: 2.0,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          fillColor: inputDecorationFill,
          prefixIcon: Icon(
            prefixIcon,
            color: commonGreyColor,
          ),
          suffixIcon: suffixIcon != null
              ? Icon(
                  suffixIcon,
                  color: commonGreyColor,
                )
              : null,
        ),
      ),
    );
  }
}
