import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PostText extends StatefulWidget {
  final double? bottomPadding;
  final double? horizPadding;
  const PostText({Key? key, this.bottomPadding = 8, this.horizPadding = 12})
      : super(key: key);

  @override
  _PostTextState createState() => _PostTextState();
}

class _PostTextState extends State<PostText> {
  bool expanded = false;
  String text =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Varius duis at consectetur lorem donec massa sapien faucibus et. Id semper risus in hendrerit gravida rutrum quisque. Nulla facilisi morbi tempus iaculis urna id volutpat. Lacus luctus accumsan tortor posuere ac ut consequat. Interdum velit euismod in pellentesque. Viverra vitae congue eu consequat ac felis donec. Vestibulum rhoncus est pellentesque elit ullamcorper dignissim. Suspendisse in est ante in nibh mauris. Proin sed libero enim sed faucibus turpis in eu.';
  late String finalText;
  late String showMoreText;

  @override
  Widget build(BuildContext context) {
    if (!expanded) {
      if (text.length < 51) {
        setState(() {
          finalText = text;
          showMoreText = '';
        });
      } else {
        setState(() {
          finalText = text.substring(0, 51);
          showMoreText = ' more...';
        });
      }
    } else {
      setState(() {
        finalText = text;
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
                  const TextSpan(
                      text: 'Username ',
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
