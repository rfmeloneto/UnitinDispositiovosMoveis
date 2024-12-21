import 'package:primeiro_app/data/service_connection.dart';
import 'package:primeiro_app/domain/post_entity.dart';

class PostRepository{
  final ServiceConnection _serviceConnection;

  PostRepository(this._serviceConnection);

  Future<List<Post>> getPosts(int? id) async { 
    List<Map<String, dynamic>> response = await _serviceConnection.getPosts(id);
    
    List<Post> posts = [];

    for (Map<String, dynamic> post in response) {
      posts.add(Post.fromMap(post));
    }

    return posts;
  }

  Future<String> postPost(Post post) async {  
    Map<String, dynamic> data = post.toMap();
    return await _serviceConnection.postPost(data);
  }

  Future<String> deletePost(int id) async {
    return await _serviceConnection.deletePost(id);
  }
  
}