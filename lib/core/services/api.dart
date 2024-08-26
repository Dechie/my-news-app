import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:my_news_app/core/models/article.dart';
import 'package:my_news_app/core/models/news_agency.dart';
import 'package:my_news_app/core/services/data/dummy_data.dart';

import '../models/user.dart';

class Api {
  Future<bool> checkInternet() async {
    // check internet connection to create
    // fake api request check.
    final customChecker = InternetConnectionChecker.createInstance(
      customCheckOptions: [
        AddressCheckOption(
          uri: Uri.parse('https://img.shields.io/pub/'),
          responseStatusFn: (response) {
            return response.statusCode == 404;
          },
        ),
      ],
      useDefaultOptions: false,
    );
    return await customChecker.hasConnection;
  }

  Future<List<Article>> getAllArticles() async {
    // our data source is the dummy data file.
    DummyData data = DummyData();
    // mock api request by creating delays
    await Future.delayed(const Duration(seconds: 3));
    bool hasInternet = await checkInternet();
    if (!hasInternet) {
      throw Exception("Can't fetch data currently. check your connection");
    }
    List<Article> allArticles = [
      ...data.trendingArticles,
      ...data.recommendedArticles,
    ];
    return allArticles;
  }

  Future<List<NewsAgency>> getNewsAgencies() async {
    DummyData data = DummyData();
    await Future.delayed(const Duration(seconds: 3));
    await Future.delayed(const Duration(seconds: 3));
    bool hasInternet = await checkInternet();
    if (!hasInternet) {
      throw Exception("Can't fetch data currently. check your connection");
    }
    return data.newsAgencies;
  }

  Future<List<Article>> getRecommendedArticles() async {
    // our data source is the dummy data file.
    DummyData data = DummyData();
    // mock api request by creating delays
    await Future.delayed(const Duration(seconds: 3));
    await Future.delayed(const Duration(seconds: 3));
    bool hasInternet = await checkInternet();
    if (!hasInternet) {
      throw Exception("Can't fetch data currently. check your connection");
    }
    return data.recommendedArticles;
  }

  Future<List<Article>> getTrendingArticles() async {
    // our data source is the dummy data file.
    DummyData data = DummyData();
    // mock api request by creating delays
    await Future.delayed(const Duration(seconds: 3));
    await Future.delayed(const Duration(seconds: 3));
    bool hasInternet = await checkInternet();
    if (!hasInternet) {
      throw Exception("Can't fetch data currently. check your connection");
    }
    return data.recommendedArticles;
  }

  Future<User> getUserProfile() async {
    await Future.delayed(const Duration(seconds: 3));
    await Future.delayed(const Duration(seconds: 3));
    bool hasInternet = await checkInternet();
    if (!hasInternet) {
      throw Exception("Can't fetch data currently. check your connection");
    }
    return User.fromMockAPI();
  }
}
