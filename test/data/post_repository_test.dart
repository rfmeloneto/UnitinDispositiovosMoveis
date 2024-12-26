import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:primeiro_app/data/reposotory.dart';
import 'package:primeiro_app/data/service_connection.dart';
import 'package:primeiro_app/domain/post_entity.dart';

// Gera os mocks para ServiceConnection
@GenerateMocks([ServiceConnection])
import 'post_repository_test.mocks.dart';

void main() {
  late MockServiceConnection mockServiceConnection;
  late PostRepository repository;

  setUp(() {
    mockServiceConnection = MockServiceConnection();
    repository = PostRepository(mockServiceConnection);
  });

  group('PostRepository Tests', () {
    test('getPosts retorna uma lista de objetos Post', () async {
      // Configura a resposta do mock
      when(mockServiceConnection.getPosts(null)).thenAnswer((_) async => [
            {'id': 1, 'title': 'Título de Teste', 'body': 'Corpo de Teste', 'userId': 101},
            {'id': 2, 'title': 'Outro Título', 'body': 'Outro Corpo', 'userId': 102},
          ]);

      // Chama o método do repositório
      final posts = await repository.getPosts(null);

      // Verifica os resultados
      expect(posts, isA<List<Post>>());
      expect(posts.length, 2);
      expect(posts[0].title, 'Título de Teste');
      expect(posts[1].body, 'Outro Corpo');
      verify(mockServiceConnection.getPosts(null)).called(1);
    });

    test('getPosts retorna um único objeto Post quando ID é fornecido', () async {
      // Configura a resposta do mock
      when(mockServiceConnection.getPosts(1)).thenAnswer((_) async => [
            {'id': 1, 'title': 'Título Único', 'body': 'Corpo Único', 'userId': 101},
          ]);

      // Chama o método do repositório
      final posts = await repository.getPosts(1);

      // Verifica os resultados
      expect(posts, isA<List<Post>>());
      expect(posts.length, 1);
      expect(posts.first.title, 'Título Único');
      verify(mockServiceConnection.getPosts(1)).called(1);
    });

    test('postPost envia os dados corretamente e retorna mensagem de sucesso', () async {
      // Configura os dados e resposta do mock
      final post = Post(id: 1, title: 'Título Teste', body: 'Corpo Teste', userId: 101);
      final postData = post.toMap();
      when(mockServiceConnection.postPost(postData)).thenAnswer((_) async => 'Post Executado com Sucesso');

      // Chama o método do repositório
      final message = await repository.postPost(post);

      // Verifica os resultados
      expect(message, 'Post Executado com Sucesso');
      verify(mockServiceConnection.postPost(post.toMap())).called(1);
    });

    test('deletePost deleta um post com sucesso e retorna mensagem de sucesso', () async {
      // Configura a resposta do mock
      when(mockServiceConnection.deletePost(1)).thenAnswer((_) async => 'Post Excluído com Sucesso');

      // Chama o método do repositório
      final message = await repository.deletePost(1);

      // Verifica os resultados
      expect(message, 'Post Excluído com Sucesso');
      verify(mockServiceConnection.deletePost(1)).called(1);
    });
  });
}
