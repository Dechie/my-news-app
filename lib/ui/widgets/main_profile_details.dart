import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_news_app/core/models/news_agency.dart';
import 'package:my_news_app/ui/shared/app_colors.dart';
import 'package:my_news_app/ui/shared/ui_helpers.dart';
import 'package:my_news_app/ui/widgets/buttons/grey_button.dart';
import 'package:my_news_app/ui/widgets/rounded_rect_image.dart';

import '../../core/models/user.dart';

class MainProfileDetails extends StatelessWidget {
  /// this widget is shared between publisher profile and user profile
  /// and because of this, it's abstracted to enable using two different
  /// objects: [NewsAgency] class and [User] class.
  /// the two objects will be nullable, and we will have a non-nullable
  /// required parameter (an enum) telling us which one value it is.

  final double widthScale, heightScale;
  final User? user;
  final NewsAgency? newsAgency;
  final ProfileType profileType;
  const MainProfileDetails({
    super.key,
    required this.widthScale,
    required this.heightScale,
    this.user,
    this.newsAgency,
    required this.profileType,
  });

  @override
  Widget build(BuildContext context) {
    /// this map is used to show the image path for the image widget
    /// if profile is user the asset path is assets/images and the
    /// class attribue is [user.image], while if the profile is
    /// news agency the asset path is assets/logos and the class attribute is
    /// [newsAgency.logo]
    String userValueStr =
        "assets/images/${user?.image ?? "assets/images/img1.jpg"}";
    String newsAgencyValueStr =
        "assets/logos/${newsAgency?.logo ?? "assets/logos/bbc-logo.png"}";
    Map<ProfileType, String> mapEnumToPath = {
      ProfileType.user: userValueStr,
      ProfileType.newsAgency: newsAgencyValueStr,
    };
    print("${user?.username ?? "no username"}, ${user?.image ?? "no image"}");
    return SizedBox(
      width: 392 * widthScale,
      height: 116 * heightScale,
      child: Row(
        children: [
          /// this is the image of the user/
          RoundedRectImage(
            width: 116 * heightScale,
            height: 116 * heightScale,
            borderRadius: 10,
            imagePath: mapEnumToPath[profileType]!,
          ),
          UIHelper.customHorizontalSpace(28 * widthScale),
          // this is the 2nd group, which shows the details
          SizedBox(
            width: 256 * widthScale,
            height: 116 * heightScale,
            child: Column(
              children: [
                /// this shows the details for user
                if (profileType == ProfileType.user) buildUserDetails(),

                /// this shows the details for newsagency
                if (profileType == ProfileType.newsAgency)
                  buildNewsAgencyDetails(),

                /// this shows the follow button
                UIHelper.customVerticalSpace(17 * heightScale),
                GreyButton(
                  onPress: () {},
                  width: 256 * widthScale,
                  height: 41 * heightScale,
                  text: "Create New",
                  darkerButton: profileType == ProfileType.newsAgency,
                  
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  buildNewsAgencyDetails() {
    return SizedBox(
      width: 248 * widthScale,
      height: 47 * heightScale,
      child: Row(
        children: [
          detailWidget(newsAgency?.totalNews ?? 0, "News"),
          detailWidget(newsAgency?.followers ?? 0, "Followers"),
          detailWidget(newsAgency?.following ?? 0, "Following"),
        ],
      ),
    );
  }

  /// this returns a row of 3 values showing the 3 relevant values for the
  /// user profile.
  SizedBox buildUserDetails() {
    return SizedBox(
      width: 248 * widthScale,
      height: 47 * heightScale,
      child: Row(
        children: [
          /// we will use the ! operator since we are sure user is not null
          detailWidget(user?.totalNews ?? 0, "News"),
          detailWidget(user?.followers ?? 0, "Followers"),
          detailWidget(user?.following ?? 0, "Following"),
        ],
      ),
    );
  }

  /// this function returns a single value of detail for the user
  /// e.g. the number of followers. it contains the number value and it
  /// accompanying label
  Expanded detailWidget(int numberValue, String label) {
    return Expanded(
      child: SizedBox(
        height: 47 * heightScale,
        child: Column(
          children: [
            Expanded(
              child: Text(
                numberValue.toString(),
                style: GoogleFonts.roboto(
                  fontSize: 20 * heightScale,
                  fontWeight: FontWeight.w700,
                  color: darkColor,
                ),
              ),
            ),
            UIHelper.customVerticalSpace(4),
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.sourceSans3(
                  fontSize: 16 * widthScale,
                  fontWeight: FontWeight.w400,
                  color: commonGreyColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// this enum specifies which type of profile is being displayed.
enum ProfileType { user, newsAgency }
