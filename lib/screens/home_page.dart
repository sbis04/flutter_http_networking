import 'package:flutter/material.dart';
import 'package:flutter_http_networking/models/post.dart';
import 'package:flutter_http_networking/utils/post_client.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PostClient _postClient = PostClient();

  String? _postTitle;
  String? _postBody;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Networking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _postTitle != null ? Text('Title:\n$_postTitle') : Container(),
            SizedBox(height: 8),
            _postBody != null ? Text('Body:\n$_postBody') : Container(),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final post = await _postClient.fetchPost(1);
                    setState(() {
                      _postTitle = post.title;
                      _postBody = post.body;
                    });
                  },
                  child: Text('GET'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final post = await _postClient.createPost(
                      "Hi Dart",
                      "Dart hello world",
                    );
                    setState(() {
                      _postTitle = post.title;
                      _postBody = post.body;
                    });
                  },
                  child: Text('POST'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final post = await _postClient.updatePost(
                      "Hello Flutter",
                      "Flutter hello world",
                    );
                    setState(() {
                      _postTitle = post.title;
                      _postBody = post.body;
                    });
                  },
                  child: Text('UPDATE'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final post = await _postClient.deletePost(2);
                    setState(() {
                      _postTitle = post.title;
                      _postBody = post.body;
                    });
                  },
                  child: Text('DELETE'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Flutter Networking'),
  //     ),
  //     body: Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: FutureBuilder<Post>(
  //         future: _postClient.fetchPost(1),
  //         builder: (context, snapshot) {
  //           if (snapshot.hasData) {
  //             Post post = snapshot.data!;

  //             return Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text('Title:\n${post.title}'),
  //                 SizedBox(height: 8),
  //                 Text('Body:\n${post.body}'),
  //               ],
  //             );
  //           }
  //           return Container();
  //         },
  //       ),
  //     ),
  //   );
  // }
}
