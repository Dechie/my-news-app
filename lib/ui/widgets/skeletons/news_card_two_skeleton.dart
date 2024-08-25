import 'package:flutter/material.dart';
import 'package:my_news_app/ui/shared/app_colors.dart';
import 'package:my_news_app/ui/shared/ui_helpers.dart';
import 'package:my_news_app/ui/widgets/skeletons/shimmer_widget.dart';
import 'package:shimmer/shimmer.dart';

// placeholder widget for newscardtwo
class NewsCardTwoSkeleton extends StatelessWidget {
  // current article data

  final Size size;

  // the scale of the device in proportion to the figma design
  // this is because the design assumes a bigger screen size than
  // normal phones.
  final double widthScale;
  final double heightScale;

  const NewsCardTwoSkeleton({
    super.key,
    required this.size,
    required this.widthScale,
    required this.heightScale,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18.0, bottom: 10),
      child: SizedBox(
        width: double.infinity,
        height: 407 * heightScale,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: lighterBlue.withOpacity(0.05),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16 * heightScale,
              vertical: 12 * widthScale,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 51 * heightScale,
                  width: double.infinity,
                  child: Row(
                    children: [
                      // placeholder of logo
                      SizedBox(
                        width: 36 * heightScale,
                        height: 36 * heightScale,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: darkColor2.withOpacity(0.09),
                          ),
                        ),
                      ),
                      UIHelper.customHorizontalSpace(20 * widthScale),
                      SizedBox(
                        height: 52 * heightScale,
                        width: 100 * widthScale,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 25 * heightScale,
                              width: 100 * widthScale,
                              child: const Row(
                                children: [
                                  ShimmerWidget(
                                    height: 15,
                                    width: 60,
                                    radius: 4,
                                  ),
                                  ShimmerWidget(
                                    height: 18,
                                    width: 18,
                                    radius: 9,
                                  ),
                                ],
                              ),
                            ),
                            const ShimmerWidget(
                              height: 15,
                              width: 50,
                              radius: 4,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),

                      ShimmerWidget(
                        height: 91 * heightScale,
                        width: 105 * widthScale,
                        radius: 8,
                      ),
                    ],
                  ),
                ),
                UIHelper.customVerticalSpace(15 * heightScale),
                ShimmerWidget(
                  height: 55 * heightScale,
                  width: 380 * widthScale,
                  radius: 8,
                ),
                UIHelper.customVerticalSpace(8 * heightScale),
                SizedBox(
                  height: 30 * heightScale,
                  width: 73 * widthScale,
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
                UIHelper.customVerticalSpace(16 * heightScale),
                ShimmerWidget(
                  width: size.width * 0.84,
                  height: 198 * heightScale,
                  radius: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
