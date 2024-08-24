import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_news_app/ui/shared/app_colors.dart';
import 'package:my_news_app/ui/shared/ui_helpers.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/constants/app_contstants.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/buttons/blue_large_button.dart';

// this is the onboarding page, which contains the page
// which the user faces after first opening the app.
class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final CarouselSliderController _carouselSliderController =
      CarouselSliderController();
  List<String> imagePaths = [
    "img1.jpg",
    "img2.jpg",
    "img3.jpg",
  ];
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // size is the size(dimensions) of current screen, each component in this
    // view. size has width and height components, and
    // each component in this screen have dimensions in the
    // form of  i.e. different ratios of size.width and size.height.
    return Scaffold(
      
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // get vertical space that has certain ratio of
          // screen size.
          UIHelper.getVerticalSpaceLarge(size),
          SizedBox(
            // the widget that creates a page view ui
            // with the images
            // it's a custom implementation of pageview using
            // carousel_slider and smooth_page_indicator packages
            width: size.width,
            height: size.height * 0.41,
            //color: Colors.red,
            child: CarouselSlider.builder(
              itemCount: 3,
              options: CarouselOptions(
                  enlargeCenterPage: true,
                  height: size.height * 0.41,
                  scrollDirection: Axis.horizontal,
                  reverse: false,
                  onPageChanged: (val, _) {
                    setState(() {
                      _current = val;
                    });
                  }),

              carouselController: _carouselSliderController,
              // carouselcontroller keeps track of scroll and updates the index
              // of the image that is currently in the center.
              // then the smooth indicator uses that index to show
              // the dots at the bottom
              itemBuilder: (context, index, realIndex) => SizedBox(
                height: size.height * .41,
                width: size.width * .8,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      commonBorderRadius,
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/images/${imagePaths[index]}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // this provides the separatioin between the listview items.
            ),
          ),
          UIHelper.getVerticalSpaceMedium(size), // 45.9 / 926.75 = 0.049
          // UIHelper contains space widgets and other useful widgets as well
          SizedBox(
            width: 63.0,
            height: 9,
            child: Center(
              child: AnimatedSmoothIndicator(
                activeIndex: _current,
                count: 3,
                effect: const WormEffect(
                  activeDotColor: primaryBlue,
                  dotColor: Color(0xfff3f4f6),
                  dotHeight: 9.13,
                  dotWidth: 9.13,
                  spacing: 5,
                ),
              ),
            ),
          ),
          UIHelper.getVerticalSpaceMedium(size),
          Text(
            "First To Know",
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 27,
              color: const Color(0xff333647),
            ),
          ),
          UIHelper.getVerticalSpaceMedium(size),
          SizedBox(
            width: 246,
            height: 45,
            child: Text(
              "All news in one place, be the first to know last news",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: const Color(0xff7C82A1),
              ),
            ),
          ),
          UIHelper.getVerticalSpaceLarge(size),
          // this button navigates to the next screen
          CommonButton(
            width: size.width * 0.89,
            height: 45.0,
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
