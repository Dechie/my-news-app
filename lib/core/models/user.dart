class User {
  int id;
  String name;
  String username;
  String description;
  int totalNews;
  int followers;
  int following;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.description,
    required this.totalNews,
    required this.followers,
    required this.following,
  });

  // factory User.fromJson(Map<String, dynamic> json) {
  //   return User(
  //     id: json['id'],
  //     name: json['name'],
  //     username: json['username'],
  //   );
  // }

  factory User.initial() {
    return User(
      id: 0,
      name: 'Tyler Mason News',
      username: 'thetylerm_news',
      totalNews: 0,
      followers: 5,
      following: 10,
      description: "This is Tyler Mason News, Enjoy!",
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
