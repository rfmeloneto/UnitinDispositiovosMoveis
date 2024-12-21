import 'package:flutter/material.dart';
import 'package:primeiro_app/data/reposotory.dart';
import 'package:primeiro_app/domain/post_entity.dart';

class PostNotifyer with ChangeNotifier{
  final PostRepository _repository;
  bool _isLoading = false;
  String? _message;
  List<Post>? _posts;
  PostNotifyer(this._repository);

  String get message => _message ?? '';
  List<Post> get posts => _posts ?? [];
  bool get isLoading => _isLoading;

  void getPosts(int? id) async {
    _isLoading = true;
    notifyListeners();
    _posts = await _repository.getPosts(id);
    _isLoading = false;
    notifyListeners();
  }

  void postPost(Post post) async {
    _isLoading = true;
    notifyListeners();
    _message = await _repository.postPost(post);
    _isLoading = false;
    notifyListeners();
  }

  void deletePost(int id) async {
    _isLoading = true;
    notifyListeners();
    _message = await _repository.deletePost(id);
    getPosts(null);
    _isLoading = false;
    notifyListeners();
  }

}