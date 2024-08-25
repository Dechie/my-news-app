import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../shared/app_colors.dart';
import '../../shared/ui_helpers.dart';
import 'shimmer_widget.dart';

/// skeleton placeholder for news card 1
class NewsCardOneSkeleton extends StatelessWidget {
  final double heightScale, widthScale;
  const NewsCardOneSkeleton({
    super.key,
    required this.heightScale,
    required this.widthScale,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 285 * widthScale,
      height: 305 * heightScale,
      child: DecoratedBox(
        decoration: const BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ShimmerWidget(
                  height: 161 * heightScale,
                  width: 285,
                  radius: 8,
                ),
                Positioned(
                  top: 18 * heightScale,
                  left:
                      18 * widthScale, // parent widget's difference added to 18
                  child: SizedBox(
                    height: 27 * heightScale,
                    width: 90 * heightScale,
                    child: Shimmer.fromColors(
                      baseColor: lighterBlue,
                      highlightColor: lighterBlue.withAlpha(150),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: lighterBlue.withAlpha(150),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            UIHelper.customVerticalSpace(12 * heightScale),
            ShimmerWidget(
              height: 50 * heightScale,
              width: 280 * widthScale,
              radius: 8,
            ),
            UIHelper.customVerticalSpace(8 * heightScale),
            SizedBox(
              width: 301 * heightScale,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0 * widthScale),
                child: Row(
                  children: [
                    ShimmerWidget(
                      width: 36 * widthScale,
                      height: 36 * heightScale,
                      radius: 4,
                    ),
                    UIHelper.customHorizontalSpace(5),
                    ShimmerWidget(
                      width: 70 * widthScale,
                      height: 25 * heightScale,
                      radius: 4,
                    ),
                    const Spacer(),
                    UIHelper.customHorizontalSpace(5),
                    ShimmerWidget(
                      width: 50 * widthScale,
                      height: 25 * heightScale,
                      radius: 4,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
