import 'package:my_news_app/core/models/news_agency.dart';

class Article {
  int id;
  String title;
  String image;
  String date;
  String category;
  NewsAgency? publisherAgency;

  Article({
    required this.id,
    required this.title,
    required this.image,
    required this.category,
    required this.date,
    this.publisherAgency,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      publisherAgency: json['newsAgency'],
      id: json['id'],
      title: json['title'],
      image: json['image'],
      category: json['category'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['category'] = category;
    data['date'] = date;
    return data;
  }
}
