import 'package:my_news_app/core/models/article.dart';
import 'package:my_news_app/ui/shared/dummy_data.dart';

class Api {
  Future<List<Article>> getRecommendedArticles() async {
    // our data source is the dummy data file.
    DummyData data = DummyData();
    // mock api request by creating delays
    await Future.delayed(const Duration(seconds: 3));
    return data.trendingArticles;
  }

  Future<List<Article>> getTrendingArticles() async {
    // our data source is the dummy data file.
    DummyData data = DummyData();
    // mock api request by creating delays
    await Future.delayed(const Duration(seconds: 3));
    return data.recommendedArticles;
  }

  // Future<User> getUserProfile(int userId) async {
  //   // Get user profile for id
  //   var uri = Uri.parse('$endpoint/users/$userId');
  //   var response = await client.get(uri);

  //   // Convert and return
  //   return User.fromJson(json.decode(response.body));
  // }
}
