class Article {
  int id;
  String title;
  String image;
  String newsSource;
  String date;
  String category;

  Article({
    required this.id,
    required this.title,
    required this.newsSource,
    required this.image,
    required this.category,
    required this.date,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      newsSource: json['newsSource'],
      image: json['image'],
      category: json['category'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['newsSource'] = newsSource;
    data['image'] = image;
    data['category'] = category;
    data['date'] = date;
    return data;
  }
}
