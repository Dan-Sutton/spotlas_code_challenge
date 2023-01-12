import 'package:flutter/material.dart';
import 'package:spotlas_code_challenge/components/post_tag.dart';

class PostTagsRow extends StatelessWidget {
  const PostTagsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: PostTag(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: PostTag(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: PostTag(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: PostTag(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: PostTag(),
                ),
              ],
            ),
          )),
    );
  }
}
