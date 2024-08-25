import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../shared/app_colors.dart';

class ShimmerWidget extends StatelessWidget {
  final double height, width, radius;
  const ShimmerWidget({
    super.key,
    required this.height,
    required this.width,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: darkColor2.withOpacity(0.45),
      highlightColor: darkColor2.withOpacity(0.12),
      child: SizedBox(
        height: height,
        width: width,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: darkColor2.withOpacity(0.12),
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
    );
  }
}
