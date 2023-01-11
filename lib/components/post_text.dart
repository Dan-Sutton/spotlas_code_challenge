import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PostText extends StatefulWidget {
  const PostText({Key? key}) : super(key: key);

  @override
  _PostTextState createState() => _PostTextState();
}

class _PostTextState extends State<PostText> {
  bool expanded = false;
  String text =
      '000000000011111111112222222222333333333344444444445555555555666666';
  late String finalText;
  late String showMoreText;

  @override
  Widget build(BuildContext context) {
    if (!expanded) {
      setState(() {
        finalText = text.substring(0, 51);
        showMoreText = ' more...';
      });
    } else {
      setState(() {
        finalText = text;
        showMoreText = ' less...';
      });
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 18, color: Colors.black),
                children: [
                  TextSpan(
                      text: 'Username ',
                      style: TextStyle(fontWeight: FontWeight.w800)),
                  TextSpan(text: finalText),
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          setState(() {
                            expanded = !expanded;
                            print(expanded);
                          });
                        },
                      text: showMoreText,
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
