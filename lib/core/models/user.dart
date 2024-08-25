import 'package:my_news_app/core/models/article.dart';

class User {
  int id;
  String name;
  String username;
  String description;
  final String image;
  int totalNews;
  int followers;
  int following;
  List<Article> articlesPublished;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.description,
    required this.totalNews,
    required this.followers,
    required this.following,
    required this.image,
  }) : articlesPublished = [];

  factory User.fromMockAPI() {
    return User(
      id: 0,
      name: 'Tyler Mason News',
      username: 'thetylerm_news',
      totalNews: 0,
      followers: 5,
      following: 10,
      description: "This is Tyler Mason News, Enjoy!",
      image: "tyler.png",
    );
  }

  factory User.initial() {
    return User(
      id: 0,
      name: 'Tyler Mason News',
      username: 'thetylerm_news',
      totalNews: 0,
      followers: 5,
      following: 10,
      description: "This is Tyler Mason News, Enjoy!",
      image: "tyler.png",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    return data;
  }
}
