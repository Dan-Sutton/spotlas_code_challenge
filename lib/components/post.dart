import 'package:flutter/material.dart';
import 'package:spotlas_code_challenge/components/post_image.dart';
import 'package:spotlas_code_challenge/components/post_tag.dart';
import 'package:spotlas_code_challenge/components/post_tags_row.dart';
import 'package:spotlas_code_challenge/components/post_text.dart';
import 'package:spotlas_code_challenge/extensions/post.dart';

import 'post_toolbar.dart';

class Post extends StatefulWidget {
  final Map<String, dynamic> map;

  const Post({Key? key, required this.map}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PostImage(
            images: widget.map['media'],
            author: widget.map['author'],
            spot: widget.map['spot']),
        PostToolbar(
          vertPadding: 16,
          horizPadding: 48,
          liked: widget.map['author'],
        ),
        PostText(
          text: widget.map['caption']['text'],
          author: widget.map['author']['username'],
          bottomPadding: 8,
          horizPadding: 12,
        ),
        PostTagsRow(
          tags: widget.map['caption']['tags'],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 12, bottom: 24),
              child: Text(
                widget.dateTimePosted,
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
    );
  }
}
