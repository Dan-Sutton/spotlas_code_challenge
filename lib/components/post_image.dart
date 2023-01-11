import 'package:flutter/material.dart';

class PostImage extends StatefulWidget {
  const PostImage({Key? key}) : super(key: key);

  @override
  _PostImageState createState() => _PostImageState();
}

class _PostImageState extends State<PostImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            child: Image.network('https://picsum.photos/500/660'),
          )
        ],
      ),
    );
  }
}
