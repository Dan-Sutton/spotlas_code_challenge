import 'package:flutter/material.dart';
import 'package:spotlas_code_challenge/components/post_tag.dart';

class PostTagsRow extends StatelessWidget {
  final List? tags;

  const PostTagsRow({Key? key, required this.tags}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    children: tags != null
                        ? tags!.map((e) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: PostTag(dispayText: e['display_text']),
                            );
                          }).toList()
                        : []),
              )),
        ),
      ],
    );
  }
}
