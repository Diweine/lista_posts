import 'package:flutter/material.dart';
import 'package:lista_posts/src/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  _success() {
    return ListView.builder(
      itemCount: controller.posts.length,
      itemBuilder: (context, index) {
        var post = controller.posts[index];
        return Padding(
          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
          child: ListTile(
            leading: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green.shade500,
              ),
              child: Center(
                child: Text(
                  post.id.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            title: Text(
              post.title.toString(),
            ),
          ),
        );
      },
    );
  }

  _error() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          controller.start();
        },
        child: Text('Carregar novamente'),
      ),
    );
  }

  _loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _start() {
    return Container();
  }

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.start:
        return _start();
      case HomeState.loading:
        return _loading();
      case HomeState.error:
        return _error();
      case HomeState.success:
        return _success();
      default:
        return _start();
    }
  }

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Posts"),
      ),
      body: AnimatedBuilder(
        animation: controller.state,
        builder: (context, child) {
          return stateManagement(controller.state.value);
        },
      ),
    );
  }
}
