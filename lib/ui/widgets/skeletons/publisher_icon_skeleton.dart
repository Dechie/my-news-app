import 'package:flutter/material.dart';
import 'package:my_news_app/ui/widgets/skeletons/shimmer_widget.dart';

import '../../shared/ui_helpers.dart';

class PublisherIconSkeleton extends StatelessWidget {
  final double height, width, widthScale, heightScale;

  const PublisherIconSkeleton({
    super.key,
    required this.height,
    required this.width,
    required this.widthScale,
    required this.heightScale,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 167 * heightScale,
      width: 147 * widthScale,
      child: Column(
        children: [
          ShimmerWidget(
            height: 60 * heightScale,
            width: 60 * widthScale,
            radius: 6,
          ),
          UIHelper.customVerticalSpace(8 * heightScale),
          ShimmerWidget(
            height: 23 * heightScale,
            width: 78 * widthScale,
            radius: 4,
          ),
          UIHelper.customVerticalSpace(16 * heightScale),
          ShimmerWidget(
            width: 115 * widthScale,
            height: 34 * heightScale,
            radius: 6,
          ),
        ],
      ),
    );
  }
}
