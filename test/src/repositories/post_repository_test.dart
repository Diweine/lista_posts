import 'package:flutter_test/flutter_test.dart';
import 'package:lista_posts/src/repositories/post_repository.dart';

main() {
  final repository = PostRepository();
  test('Deve trazer uma lista de Post', () async {
    final list = await repository.fetchPosts();
    //print(list[0].title);
    expect(list[0].title,
        'sunt aut facere repellat provident occaecati excepturi optio reprehenderit');
  });
}
