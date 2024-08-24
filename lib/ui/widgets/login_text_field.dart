import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_news_app/ui/shared/app_colors.dart';

class LoginTextField extends StatelessWidget {
  final double width, height;
  final String prefixSvgPath;
  final String? suffixSvgPath;
  final prefixSvgHeight, suffixSvgHeight;
  final String hintText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextEditingController editingController;

  const LoginTextField({
    super.key,
    required this.width,
    required this.height,
    required this.prefixSvgPath,
    required this.hintText,
    this.suffixSvgPath,
    required this.prefixSvgHeight,
    required this.suffixSvgHeight,
    required this.validator,
    required this.onSaved,
    required this.editingController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: inputDecorationFill,
      width: width,
      height: height,
      child: TextFormField(
        validator: validator,
        onSaved: onSaved,
        controller: editingController,
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
          prefixIcon: Padding(
            padding: const EdgeInsets.all(13.0),
            child: SvgPicture.asset(
              "assets/svgs/$prefixSvgPath",
              height: prefixSvgHeight,
              width: prefixSvgHeight,
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
          suffixIcon: suffixSvgPath != null
              ? Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    "assets/svgs/$suffixSvgPath",
                    height: suffixSvgHeight,
                    width: suffixSvgHeight,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
