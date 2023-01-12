import 'package:flutter/material.dart';
import 'package:spotlas_code_challenge/components/post_image.dart';
import 'package:spotlas_code_challenge/components/post_tag.dart';
import 'package:spotlas_code_challenge/components/post_tags_row.dart';
import 'package:spotlas_code_challenge/components/post_text.dart';

import 'post_toolbar.dart';

class Post extends StatelessWidget {
  final Map<String, dynamic> map;

  const Post({Key? key, required this.map}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          const PostTagsRow(),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 12, bottom: 24),
                child: Text(
                  '4 days ago',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[400],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
