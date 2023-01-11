import 'package:flutter/material.dart';
import 'package:spotlas_code_challenge/components/post_image.dart';
import 'package:spotlas_code_challenge/components/post_text.dart';

import 'post_toolbar.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      width: 500,
      color: Colors.grey,
      child: Column(
        children: [
          PostImage(),
          PostToolbar(),
          PostText(),
        ],
      ),
    );
  }
}
