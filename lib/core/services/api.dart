class Api {
  // static const endpoint = 'https://jsonplaceholder.typicode.com';

  // var client = http.Client();

  // Future<List<Comment>> getCommentsForPost(int postId) async {
  //   List<Comment> comments = <Comment>[];

  //   // Get comments for post
  //   var uri = Uri.parse('$endpoint/comments?postId=$postId');
  //   var response = await client.get(uri);

  //   // Parse into List
  //   var parsed = json.decode(response.body) as List<dynamic>;

  //   // Loop and convert each item to a Comment
  //   for (var comment in parsed) {
  //     comments.add(Comment.fromJson(comment));
  //   }

  //   return comments;
  // }

  // Future<List<Post>> getPostsForUser(int userId) async {
  //   List<Post> posts = [];
  //   // Get user posts for id
  //   var uri = Uri.parse('$endpoint/posts?userId=$userId');
  //   var response = await client.get(uri);

  //   // parse into List
  //   var parsed = json.decode(response.body) as List<dynamic>;

  //   // loop and convert each item to Post
  //   for (var post in parsed) {
  //     posts.add(Post.fromJson(post));
  //   }

  //   return posts;
  // }

  // Future<User> getUserProfile(int userId) async {
  //   // Get user profile for id
  //   var uri = Uri.parse('$endpoint/users/$userId');
  //   var response = await client.get(uri);

  //   // Convert and return
  //   return User.fromJson(json.decode(response.body));
  // }
}
