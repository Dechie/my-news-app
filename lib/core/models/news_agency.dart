import 'article.dart';

class NewsAgency {
  int id;
  String logo;
  String sourceTitle;
  String sourceUsername;
  String description;
  int totalNews;
  int followers;
  int following;

  List<Article> articlesPublished;
  NewsAgency({
    required this.id,
    required this.sourceTitle,
    required this.logo,
    required this.totalNews,
    required this.followers,
    required this.following,
    required this.description,
    required this.sourceUsername,
    this.articlesPublished = const [],
  });

  /// data comes from dummy data file

  factory NewsAgency.fromJson(Map<String, dynamic> json) {
    return NewsAgency(
      id: json['id'],
      articlesPublished: json['articlesPublished'],
      sourceTitle: json['sourceTitle'],
      sourceUsername: json['sourceUsername'],
      description: json['description'],
      logo: json['logo'],
      totalNews: json['totalNews'],
      followers: json['followers'],
      following: json['following'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['logo'] = logo;
    data['sourceTitle'] = sourceTitle;
    data['totalNews'] = totalNews;
    data['followers'] = followers;
    data['following'] = following;
    return data;
  }
}
