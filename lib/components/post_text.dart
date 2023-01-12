import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PostText extends StatefulWidget {
  final String author;
  final String text;
  final double? bottomPadding;
  final double? horizPadding;
  const PostText(
      {Key? key,
      this.bottomPadding = 8,
      this.horizPadding = 12,
      required this.author,
      required this.text})
      : super(key: key);

  @override
  _PostTextState createState() => _PostTextState();
}

class _PostTextState extends State<PostText> {
  bool expanded = false;

  late String finalText;
  late String showMoreText;

  @override
  Widget build(BuildContext context) {
    if (!expanded) {
      if (widget.text.length <= 86) {
        setState(() {
          finalText = widget.text;
          showMoreText = '';
        });
      } else {
        setState(() {
          finalText = widget.text.substring(0, 85);
          showMoreText = ' more...';
        });
      }
    } else {
      setState(() {
        finalText = widget.text;
        showMoreText = ' less...';
      });
    }

    return Container(
      padding: EdgeInsets.only(
          left: widget.horizPadding!,
          right: widget.horizPadding!,
          bottom: widget.bottomPadding!),
      child: Row(
        children: [
          Expanded(
            child: RichText(
              maxLines: null,
              text: TextSpan(
                style: TextStyle(fontSize: 18, color: Colors.black),
                children: [
                  TextSpan(
                      text: '${widget.author} ',
                      style: TextStyle(fontWeight: FontWeight.w800)),
                  TextSpan(text: finalText),
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          setState(() {
                            expanded = !expanded;
                          });
                        },
                      text: showMoreText,
                      style: TextStyle(color: Colors.grey[400])),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
