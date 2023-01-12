import 'package:flutter/material.dart';
import 'package:spotlas_code_challenge/components/post_image.dart';
import 'package:spotlas_code_challenge/components/post_tag.dart';
import 'package:spotlas_code_challenge/components/post_tags_row.dart';
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
      // color: Colors.grey,
      child: Column(
        children: [
          const PostImage(),
          const PostToolbar(
            vertPadding: 16,
            horizPadding: 48,
          ),
          const PostText(
            bottomPadding: 8,
            horizPadding: 12,
          ),
          Row(
            children: [
              PostTagsRow(),
            ],
          )
        ],
      ),
    );
  }
}
