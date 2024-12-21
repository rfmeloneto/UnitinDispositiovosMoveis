import 'package:dio/dio.dart';

class ServiceConnection{
  Dio dio = Dio();
  final String baseUrl = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Map<String, dynamic>>> getPosts(int? id) async {
    await Future.delayed(const Duration(seconds: 2));
    var response = await dio.get(baseUrl+(id == null ? "" : "/$id"));
    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar posts');
    }
    else{
      if (id != null) {
        return [response.data as Map<String, dynamic>];
      }
      else{
        print(response.data);
        return (response.data as List)
        .map((item) => item as Map<String, dynamic>)
        .toList();
      }
      
    }
  }

  Future<String> postPost(Map<String, dynamic> data) async {
    String mensagem = "Post Executado com Sucesso";
    var response = await dio.post(baseUrl, data: data);
    if (response.statusCode != 201) {
      throw Exception('Falha ao carregar posts');
    }
    else{
      return mensagem;
    }
  }

  Future<String> deletePost(int id) async {
    String mensagem = "Post Excluido com Sucesso";
    var response = await dio.delete("$baseUrl/$id");
    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar posts');
    }
    else{
      return mensagem;
    }
  }


}