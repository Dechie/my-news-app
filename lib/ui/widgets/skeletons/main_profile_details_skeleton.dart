import 'package:flutter/material.dart';
import 'package:my_news_app/ui/widgets/skeletons/shimmer_widget.dart';

import '../../shared/ui_helpers.dart';

class MainProfileDetailsSkeleton extends StatelessWidget {
  final double widthScale, heightScale;
  const MainProfileDetailsSkeleton(
      {super.key, required this.widthScale, required this.heightScale});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 392 * widthScale,
      height: 116 * heightScale,
      child: Row(
        children: [
          ShimmerWidget(
            height: 116 * heightScale,
            width: 116 * heightScale,
            radius: 10,
          ),
          UIHelper.customHorizontalSpace(28 * widthScale),
          SizedBox(
            width: 256 * widthScale,
            height: 116 * heightScale,
            child: Column(
              children: [
                SizedBox(
                  width: 248 * widthScale,
                  height: 47 * heightScale,
                  child: Row(
                    children: [
                      buildDetails(),
                      buildDetails(),
                      buildDetails(),
                    ],
                  ),
                ),
                UIHelper.customVerticalSpace(17 * heightScale),
                ShimmerWidget(
                  width: 256 * widthScale,
                  height: 41 * heightScale,
                  radius: 6,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded buildDetails() {
    return Expanded(
      child: SizedBox(
        height: 47 * heightScale,
        child: Column(
          children: [
            Expanded(
              child: ShimmerWidget(
                height: 21 * heightScale,
                width: 50 * widthScale,
                radius: 4,
              ),
            ),
            UIHelper.customVerticalSpace(4),
            Expanded(
              child: ShimmerWidget(
                height: 21 * heightScale,
                width: 50 * widthScale,
                radius: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
