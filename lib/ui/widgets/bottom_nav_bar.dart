import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_news_app/ui/shared/app_colors.dart';

import '../../core/constants/app_contstants.dart';

/// custom implementation of navbar with customized themes.
/// it involves icons and texts, where texts only appear for the
/// current active view/screen. and the icons are svg pictures
/// taken from the figma design.
class BottomNavyBar extends StatefulWidget {
  final int selectedIndex;

  const BottomNavyBar({
    super.key,
    required this.selectedIndex,
  });
  @override
  State<BottomNavyBar> createState() => _BottomNavyBarState();
}

/// navigation item is an item on the navbar.
/// it takes the path of current item's svg icon,
/// the title of current item, the route of current item
/// (which comes from the static route paths), i.e, the global value
/// of the app's routes
/// and it (navigation item) also takes an optional argument
class NavigationItem {
  final String svgPath;
  final Text title;
  final String route;
  final dynamic argument;
  NavigationItem({
    required this.svgPath,
    required this.title,
    required this.route,
    this.argument,
  });
}

class _BottomNavyBarState extends State<BottomNavyBar> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = widget.selectedIndex;
    List<dynamic> items = [
      NavigationItem(
        route: RoutePaths.home,
        svgPath: selectedIndex == 0
            ? "home/home_active.svg"
            : "home/home_inactive.svg",
        title: Text(
          'Home',
          style: TextStyle(
            color: selectedIndex == 0 ? darkColor : Colors.white,
          ),
        ),
      ),
      NavigationItem(
        route: RoutePaths.discover,
        svgPath: selectedIndex == 1
            ? "discover/discover_active.svg"
            : "discover/discover_inactive.svg",
        title: Text(
          'Discover',
          style: TextStyle(
            color: selectedIndex == 1 ? darkColor : Colors.white,
          ),
        ),
      ),
      NavigationItem(
        route: RoutePaths.onboarding,
        svgPath: selectedIndex == 2
            ? "bookmarks/bookmarks_active.svg"
            : "bookmarks/bookmarks_inactive.svg",
        title: Text(
          'Bookmarks',
          style: TextStyle(
            color: selectedIndex == 2 ? darkColor : Colors.white,
          ),
        ),
      ),
      NavigationItem(
        route: RoutePaths.splash,
        svgPath: selectedIndex == 3
            ? "profile/profile_active.svg"
            : "profile/profile_inactive.svg",
        title: Text(
          'Profile',
          style: TextStyle(
            color: selectedIndex == 3 ? darkColor : Colors.white,
          ),
        ),
      ),
    ];
    Widget buildItem(NavigationItem item, bool isSelected) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isSelected ? 125 : 50,
        height: double.maxFinite,
        padding: isSelected
            ? const EdgeInsets.only(left: 16.0)
            : const EdgeInsets.only(left: 8),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/svgs/${item.svgPath}"),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: isSelected
                      ? DefaultTextStyle.merge(child: item.title)
                      : const SizedBox(),
                ),
              ],
            ),
          ],
        ),
      );
    }

    print('${items.length} number of items');
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.white,
          //color: bgColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: items.map((item) {
              var itemIndex = items.indexOf(item);
              return GestureDetector(
                onTap: () {
                  print('you tapped this');
                  Navigator.of(context).pushNamed(
                    item.route,
                    arguments: item.route == "argpath" ? {item.arg} : null,
                  );
                  setState(() {
                    selectedIndex = itemIndex;
                  });
                },
                child: buildItem(item, selectedIndex == itemIndex),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
