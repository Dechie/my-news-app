import 'package:my_news_app/core/models/article.dart';
import 'package:my_news_app/core/services/api.dart';
import 'package:my_news_app/core/viewModels/base/base_view_movel.dart';

import '../constants/enums.dart';

class HomeVModel extends BaseViewModel {
  final apiService = Api();

  final List<Article> _recommendedArticles = [];
  final List<Article> _trendingArticles = [];

  List<Article> get recommendedArticles => _recommendedArticles;
  List<Article> get trendingArticles => _trendingArticles;

  Future<void> getRecommended() async {
    setState(ViewState.busy); // Set state to busy when fetching starts

    try {
      List<Article> articles = await apiService.getRecommendedArticles();
      _recommendedArticles.clear(); // Clear previous data
      _recommendedArticles.addAll(articles); // Add fetched articles
      setState(ViewState.idle);
    } catch (e) {
      setError(e.toString());
      setState(ViewState.error);
    }
  }

  Future<void> getTrending() async {
    setState(ViewState.busy);

    try {
      print("Fetching articles...");
      List<Article> articles = await apiService.getTrendingArticles();
      print("Fetched articles: $articles");

      _trendingArticles.clear();
      _trendingArticles.addAll(articles); // Add fetched articles
      setState(ViewState.idle);
    } catch (e) {
      setError(e.toString());
      setState(ViewState.error);
    }
  }
}
