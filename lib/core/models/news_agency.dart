class NewsAgency {
  int id;
  String logo;
  String sourceTitle;
  int totalNews;
  int followers;
  int following;

  NewsAgency({
    required this.id,
    required this.sourceTitle,
    required this.logo,
    required this.totalNews,
    required this.followers,
    required this.following,
  });

  factory NewsAgency.fromJson(Map<String, dynamic> json) {
    return NewsAgency(
      id: json['id'],
      sourceTitle: json['sourceTitle'],
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
