import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PostText extends StatefulWidget {
  const PostText({Key? key}) : super(key: key);

  @override
  _PostTextState createState() => _PostTextState();
}

class _PostTextState extends State<PostText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 17),
                children: [
                  TextSpan(
                      text: 'Username ',
                      style: TextStyle(fontWeight: FontWeight.w800)),
                  TextSpan(
                      text:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => print('Show more tapped!'),
                      text: 'more...',
                      style: TextStyle(fontWeight: FontWeight.w800)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
