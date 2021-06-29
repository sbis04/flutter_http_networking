import 'dart:convert';

import 'package:flutter_http_networking/models/post.dart';
import 'package:http/http.dart' as http;

class PostClient {
  Future<Post?> fetchPost(int postId) async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts/$postId");
    final response = await http.get(url);
    Post retrievedPost;

    if (response.statusCode == 200) {
      retrievedPost = Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load post: $postId');
    }

    return retrievedPost;
  }
}
