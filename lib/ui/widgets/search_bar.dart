import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_news_app/ui/shared/text_styles.dart';

import '../../core/models/article.dart';
import '../../core/services/data/dummy_data.dart';

/// here we declare a widget using
/// flutter's advanced search functionality
///
///
/// flutter's built in widget that provides advanced
/// search functionalities
class CustomSearchBar extends StatelessWidget {
  final double widthScale, heightScale;
  String? customLabel;
  CustomSearchBar({
    super.key,
    required this.widthScale,
    required this.heightScale,
    this.customLabel,
  });

  @override
  Widget build(BuildContext context) {
    DummyData data = DummyData();
    return SearchAnchor(
      viewLeading: SearchAnchor(
        builder: (context, controller) {
          return IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              controller.openView(); // Open the search suggestions
            },
          );
        },
        suggestionsBuilder: (context, query) {
          // Combine recommendedArticles and trendingArticles
          List<Article> combinedArticles = [
            // TODO: implement provider
            ...data.recommendedArticles,
            ...data.trendingArticles,
          ];

          // Filter the articles based on the search query
          List<Article> filteredArticles = combinedArticles.where((article) {
            return article.title
                .toLowerCase()
                .contains(query.text.toLowerCase());
          }).toList();

          // Return a list of Text widgets as suggestions
          return filteredArticles.map((article) {
            return ListTile(
              title: Text(article.title),
              subtitle: Text('${article.category} - ${article.date}'),
              onTap: () {
                // Handle tap on suggestion
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ArticleDetailView(article: article),
                //   ),
                // );
              },
            );
          }).toList();
        },
      ),
      builder: (context, controller) {
        return SearchBar(
          controller: controller,
          hintText: customLabel ?? "Search \"News\"",
          elevation: const WidgetStatePropertyAll<double>(0),
          backgroundColor: WidgetStatePropertyAll<Color>(
            const Color(0xffd9eff9).withOpacity(0.3),
          ),
          hintStyle: WidgetStatePropertyAll<TextStyle>(
            /// take the common sourceSans
            /// style from text_styles and modify the color only
            sourceSansW400A(widthScale).copyWith(
              color: const Color(0xff666666),
            ),
          ),
          leading: Padding(
            padding:
                EdgeInsets.all(15.0 * heightScale), // Adjust padding as needed
            child: SvgPicture.asset(
              "assets/svgs/search_button.svg",
              width: 20 * heightScale,
              height: 20 * heightScale,
            ),
          ),
        );
      },
      suggestionsBuilder: (context, query) {
        List<Article> combinedArticles = [
          ...data.recommendedArticles,
          ...data.trendingArticles,
        ];

        // Filter the articles based on the search query
        List<Article> filteredArticles = combinedArticles.where((article) {
          return article.title.toLowerCase().contains(query.text);
        }).toList();

        // Return a list of Text widgets as suggestions
        return filteredArticles.map((article) {
          return ListTile(
            title: Text(article.title),
            subtitle: Text('${article.category} - ${article.date}'),
            onTap: () {},
          );
        }).toList();
      },
    );
  }
}
