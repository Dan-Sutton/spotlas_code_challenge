import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 660,
      width: 500,
      color: Colors.grey,
    );
  }
}
