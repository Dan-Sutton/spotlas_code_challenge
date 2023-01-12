import 'package:flutter/material.dart';
import 'package:spotlas_code_challenge/components/post.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Feed',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Post(),
          Post(),
          Post(),
        ],
      ),
    );
  }
}
