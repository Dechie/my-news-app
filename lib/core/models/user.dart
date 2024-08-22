class User {
  int id;
  String name;
  String username;
  User({
    required this.id,
    required this.name,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
    );
  }

  factory User.initial() {
    return User(
      id: 0,
      name: '',
      username: '',
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
