import 'package:flutter/material.dart';

class RoundedRectImage extends StatelessWidget {
  final double width, height, borderRadius;

  final String imagePath;
  const RoundedRectImage({
    super.key,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
      ),
    );
  }
}
