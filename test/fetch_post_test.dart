import 'package:flutter_http_networking/models/post.dart';
import 'package:flutter_http_networking/utils/post_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_post_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  PostClient _postClient = PostClient();

  final postEndpoint =
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1');

  group('fetchPost', () {
    test('successful request', () async {
      final client = MockClient();

      when(
        client.get(postEndpoint),
      ).thenAnswer((_) async => http.Response(
          '{"userId": 1, "id": 2, "title": "mock post", "body": "post body"}',
          200));

      expect(await _postClient.fetchPost(client, 1), isA<Post>());
    });

    test('unsuccessful request', () {
      final client = MockClient();

      when(
        client.get(postEndpoint),
      ).thenAnswer((_) async => http.Response('Not Found', 404));

      expect(_postClient.fetchPost(client, 1), throwsException);
    });
  });
}
