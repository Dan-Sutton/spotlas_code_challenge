import 'package:flutter/material.dart';
import 'package:spotlas_code_challenge/icons/spotlasicons_icons.dart';

class PostToolbar extends StatelessWidget {
  const PostToolbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(Spotlasicons.map_border),
          Icon(Spotlasicons.speech_bubble_border),
          Icon(Spotlasicons.heart_border),
          Icon(Spotlasicons.paper_plane_border),
        ],
      ),
    );
  }
}
