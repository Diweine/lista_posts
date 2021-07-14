import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_posts/src/home_page.dart';

void main() {
  //getPosts();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Posts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green.shade700,
      ),
      home: HomePage(),
    );
  }
}
