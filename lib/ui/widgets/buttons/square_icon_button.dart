import 'package:flutter/material.dart';
import 'package:my_news_app/ui/shared/app_colors.dart';

class SquareIconButton extends StatelessWidget {
  final IconData iconData;

  final void Function() onPress;
  final double widthScale, heightScale;
  const SquareIconButton({
    super.key,
    required this.widthScale,
    required this.heightScale,
    required this.iconData,
    required this.onPress,
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
            padding: const EdgeInsets.all(14.0),
            child: Center(
              child: Icon(
                iconData,
                size: 24 * heightScale,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
