import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotlas_code_challenge/icons/spotlasicons_icons.dart';
import 'package:spotlas_code_challenge/models/feed_data.dart';

class PostToolbar extends StatefulWidget {
  final double? vertPadding;
  final double? horizPadding;
  final Map<String, dynamic> liked;

  final void updateLiked;
  const PostToolbar(
      {Key? key,
      this.vertPadding = 16,
      this.horizPadding = 48,
      this.updateLiked,
      required this.liked})
      : super(key: key);

  @override
  State<PostToolbar> createState() => _PostToolbarState();
}

class _PostToolbarState extends State<PostToolbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: widget.vertPadding!, horizontal: widget.horizPadding!),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Spotlasicons.map_border),
          Icon(Spotlasicons.speech_bubble_border),
          GestureDetector(
              child: widget.liked['is_verified']
                  ? const Icon(
                      Spotlasicons.heart,
                      color: Color.fromRGBO(255, 0, 106, 1),
                    )
                  : const Icon(Spotlasicons.heart_border),
              onTap: () =>
                  context.read<FeedData>().likeImage(widget.liked['id'])),
          Icon(Spotlasicons.paper_plane_border),
        ],
      ),
    );
  }
}
