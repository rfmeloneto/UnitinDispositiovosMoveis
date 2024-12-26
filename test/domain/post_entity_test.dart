import 'package:flutter_test/flutter_test.dart';
import 'package:primeiro_app/domain/post_entity.dart';

void main() {
  group('Post Entity Tests', () {
    test('toMap converts a Post to a Map correctly', () {
      final post = Post(id: 1, title: 'Test Title', body: 'Test Body', userId: 101);

      final map = post.toMap();

      expect(map, {
        'id': 1,
        'title': 'Test Title',
        'body': 'Test Body',
        'userId': 101,
      });
    });

    test('fromMap converts a Map to a Post correctly', () {
      final map = {
        'id': 1,
        'title': 'Test Title',
        'body': 'Test Body',
        'userId': 101,
      };

      final post = Post.fromMap(map);

      expect(post.id, 1);
      expect(post.title, 'Test Title');
      expect(post.body, 'Test Body');
      expect(post.userId, 101);
    });
  });
}
