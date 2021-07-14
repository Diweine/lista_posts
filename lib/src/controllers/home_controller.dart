import 'package:flutter/cupertino.dart';
import 'package:lista_posts/src/models/post_model.dart';
import 'package:lista_posts/src/repositories/post_repository.dart';

class HomeController {
  List<Post> posts = [];

  final repository = PostRepository();
  final state = ValueNotifier<HomeState>(HomeState.start);

  Future start() async {
    state.value = HomeState.loading;
    try {
      posts = await repository.fetchPosts();
      state.value = HomeState.success;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start, loading, success, error }
