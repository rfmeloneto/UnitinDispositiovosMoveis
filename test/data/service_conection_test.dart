import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:primeiro_app/data/service_connection.dart';
import 'package:dio/dio.dart';

import 'service_conection_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  group('ServiceConnection Tests', () {
    late MockDio mockDio;
    late ServiceConnection serviceConnection;

    setUp(() {
      mockDio = MockDio();
      serviceConnection = ServiceConnection()..dio = mockDio; // Substitui o Dio original pelo mock
    });

    test('getPosts retorna uma lista de posts quando id é null', () async {
      // Configura o mock para retornar uma resposta simulada
      when(mockDio.get(any)).thenAnswer(
        (_) async => Response(
          data: [
            {'id': 1, 'title': 'Test Title', 'body': 'Test Body', 'userId': 101}
          ],
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      final posts = await serviceConnection.getPosts(null);

      expect(posts.length, 1);
      expect(posts.first['title'], 'Test Title');
    });

    test('getPosts retorna um único post quando id não é null', () async {
      // Configura o mock para retornar uma resposta simulada
      when(mockDio.get(any)).thenAnswer(
        (_) async => Response(
          data: {'id': 1, 'title': 'Test Title', 'body': 'Test Body', 'userId': 101},
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      final posts = await serviceConnection.getPosts(1);

      expect(posts.length, 1);
      expect(posts.first['title'], 'Test Title');
    });

    test('postPost envia os dados corretamente', () async {
      // Configura o mock para retornar uma resposta simulada
      when(mockDio.post(any, data: anyNamed('data'))).thenAnswer(
        (_) async => Response(
          data: {},
          statusCode: 201,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      final message = await serviceConnection.postPost({
        'title': 'New Title',
        'body': 'New Body',
        'userId': 1,
      });

      expect(message, 'Post Executado com Sucesso');
      verify(mockDio.post(
        any,
        data: {
          'title': 'New Title',
          'body': 'New Body',
          'userId': 1,
        },
      )).called(1);
    });

    test('deletePost exclui o post corretamente', () async {
      // Configura o mock para retornar uma resposta simulada
      when(mockDio.delete(any)).thenAnswer(
        (_) async => Response(
          data: {},
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      final message = await serviceConnection.deletePost(1);

      expect(message, 'Post Excluido com Sucesso');
      verify(mockDio.delete(any)).called(1);
    });

    test('getPosts lança uma exceção para status diferente de 200', () async {
      // Configura o mock para retornar uma resposta com erro
      when(mockDio.get(any)).thenAnswer(
        (_) async => Response(
          data: null,
          statusCode: 404,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      expect(() async => await serviceConnection.getPosts(null),
          throwsA(isA<Exception>()));
    });
  });
}
