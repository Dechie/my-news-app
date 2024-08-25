import 'package:my_news_app/core/models/article.dart';
import 'package:my_news_app/core/models/news_agency.dart';
import 'package:my_news_app/ui/shared/dummy_data.dart';

import '../models/user.dart';

class Api {
  Future<List<Article>> getAllArticles() async {
    // our data source is the dummy data file.
    DummyData data = DummyData();
    // mock api request by creating delays
    await Future.delayed(const Duration(seconds: 3));
    List<Article> allArticles = [
      ...data.trendingArticles,
      ...data.recommendedArticles,
    ];
    return allArticles;
  }

  Future<List<NewsAgency>> getNewsAgencies() async {
    DummyData data = DummyData();
    await Future.delayed(const Duration(seconds: 3));
    return data.newsAgencies;
  }

  Future<List<Article>> getRecommendedArticles() async {
    // our data source is the dummy data file.
    DummyData data = DummyData();
    // mock api request by creating delays
    await Future.delayed(const Duration(seconds: 3));
    return data.recommendedArticles;
  }

  Future<List<Article>> getTrendingArticles() async {
    // our data source is the dummy data file.
    DummyData data = DummyData();
    // mock api request by creating delays
    await Future.delayed(const Duration(seconds: 3));
    return data.recommendedArticles;
  }

  Future<User> getUserProfile(int userId) async {
    await Future.delayed(const Duration(seconds: 3));
    return User.fromMockAPI();
  }
}
