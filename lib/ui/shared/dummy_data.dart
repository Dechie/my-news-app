import 'package:my_news_app/core/models/news_agency.dart';

import '../../core/models/article.dart';

/// this class is required because
/// the data is complex and it would have better
/// been used with relational database, but
/// for now we are just using this method to
/// store data in-memory.
///
/// so we will create values manually and set them up
///
part 'd_data_static.dart';

class DummyData {
  List<Article> trendingArticles = [];
  List<Article> recommendedArticles = [];
  List<NewsAgency> newsAgencies = [];
  DummyData() {
    initialize();
    setup();
  }
  initialize() {
    // setup the published articles of the
    // news agencies
    bbc.articlesPublished = [];
    espn.articlesPublished = [recom2];
    forbes.articlesPublished = [recom1];
    nyt.articlesPublished = [tr2];

    // setup the news agencies of the articles
    recom1.publisherAgency = forbes;
    recom2.publisherAgency = espn;
    tr1.publisherAgency = bbc;
    tr2.publisherAgency = nyt;
  }

  void setup() {
    newsAgencies = [
      bbc,
      nyt,
      forbes,
      espn,
    ];

    trendingArticles = [
      tr1,
      tr2,
    ];
    recommendedArticles = [
      recom1,
      recom2,
    ];
  }
}
