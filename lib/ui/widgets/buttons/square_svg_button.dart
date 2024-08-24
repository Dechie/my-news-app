import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_news_app/ui/shared/app_colors.dart';

/// this button takes an SVG asset as an argument,
/// and renders svg icon using flutter_svg package.
/// the SVG's are all taken from the figma design.
class SquareSVGButton extends StatelessWidget {
  final void Function() onPress;
  final double widthScale, heightScale;
  final String iconPath;

  const SquareSVGButton({
    super.key,
    required this.widthScale,
    required this.heightScale,
    required this.onPress,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: SizedBox(
        width: 52 * heightScale,
        height: 52 * heightScale,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: lighterGrey,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: SvgPicture.asset(
                "assets/svgs/$iconPath",
                width: 24 * heightScale,
                height: 24 * heightScale,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
