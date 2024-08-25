import 'package:flutter/material.dart';
import 'package:my_news_app/core/models/article.dart';
import 'package:my_news_app/core/services/api.dart';

import '../constants/enums.dart';

class HomeVModel extends ChangeNotifier {
  final apiService = Api();
  ViewState _state = ViewState.idle;

  final List<Article> _recommendedArticles = [];
  final List<Article> _trendingArticles = [];
  String _error = "no error";

  String get error => _error;
  List<Article> get recommendedArticles => _recommendedArticles;
  ViewState get state => _state;
  List<Article> get trendingArticles => _trendingArticles;

  Future<void> getRecommended() async {
    setState(ViewState.busy); // Set state to busy when fetching starts

    try {
      print("Fetching articles...");
      List<Article> articles = await apiService.getRecommendedArticles();
      print("Fetched articles: $articles");

      _recommendedArticles.clear(); // Clear previous data
      _recommendedArticles.addAll(articles); // Add fetched articles
      setState(ViewState.idle);
    } catch (e) {
      _error = e.toString();
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
      _error = e.toString();
      setState(ViewState.error);
    }
  }

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
