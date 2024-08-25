import 'package:my_news_app/core/models/article.dart';
import 'package:my_news_app/core/models/news_agency.dart';
import 'package:my_news_app/core/viewModels/base/base_view_movel.dart';

import '../constants/enums.dart';
import '../services/api.dart';

class DiscoverVModel extends BaseViewModel {
  final apiService = Api();

  final List<Article> _allArticles = [];
  final List<Article> _recommendedArticles = [];
  final List<NewsAgency> _newsAgencies = [];
  int _newsTypesIndex = 0;
  final List<String> _newsTypes = [
    "All",
    "Recommended",
    "Popular",
    "Most Visited",
    "Trending"
  ];
  List<Article> get allArticles => _allArticles;

  List<NewsAgency> get newsAgencies => _newsAgencies;
  List<String> get newsTypes => _newsTypes;
  int get newsTypesIndex => _newsTypesIndex;
  List<Article> get recommendedArticles => _recommendedArticles;

  Future<void> getAllArticles() async {
    setState(ViewState.busy);
    try {
      List<Article> articles = await apiService.getAllArticles();
      _allArticles.clear(); // Clear previous data
      _allArticles.addAll(articles); // Add fetched articles
      setState(ViewState.idle);
    } catch (e) {
      setError(e.toString());
      setState(ViewState.error);
    }
  }

  Future<void> getNewsAgencies() async {
    setState(ViewState.busy);
    try {
      List<NewsAgency> agencies = await apiService.getNewsAgencies();
      _newsAgencies.clear();
      _newsAgencies.addAll(agencies);
      setState(ViewState.idle);
    } catch (e) {
      setError(e.toString());
      setState(ViewState.error);
    }
  }

  Future<void> getRecommended() async {
    setState(ViewState.busy);
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

  void setNewsTypesIndex(int index) {
    _newsTypesIndex = index;
    notifyListeners();
  }
}
