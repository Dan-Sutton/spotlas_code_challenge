import 'package:flutter/material.dart';
import 'package:spotlas_code_challenge/components/post_location_row.dart';
import 'package:spotlas_code_challenge/components/post_user_row.dart';

class PostImage extends StatefulWidget {
  final String image;
  const PostImage({Key? key, required this.image}) : super(key: key);

  @override
  _PostImageState createState() => _PostImageState();
}

class _PostImageState extends State<PostImage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(widget.image),
        const Padding(
          padding: EdgeInsets.only(top: 12),
          child: PostUserRow(),
        ),
        const Positioned(
          left: 1,
          right: 1,
          bottom: 0,
          child: Padding(
            padding: EdgeInsets.only(bottom: 12.0),
            child: PostLocationRow(),
          ),
        )
      ],
    );
  }
}
