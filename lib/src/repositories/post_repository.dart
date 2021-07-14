import 'package:dio/dio.dart';
import 'package:lista_posts/src/models/post_model.dart';

class PostRepository {
  final dio = Dio();
  final url = 'http://jsonplaceholder.typicode.com/posts';

  Future<List<Post>> fetchPosts() async {
    final response = await dio.get(url);
    final list = response.data as List;

    return list.map((json) => Post.fromJson(json)).toList();
  }
}
