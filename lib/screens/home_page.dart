import 'package:flutter/material.dart';
import 'package:flutter_http_networking/models/post.dart';
import 'package:flutter_http_networking/utils/http_client.dart';

class HomePage extends StatelessWidget {
  final PostClient _postClient = PostClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Networking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<Post?>(
          future: _postClient.fetchPost(1),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Post post = snapshot.data!;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Title:\n${post.title}'),
                  SizedBox(height: 8),
                  Text('Body:\n${post.body}'),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
