import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotlas_code_challenge/icons/spotlasicons_icons.dart';
import 'package:spotlas_code_challenge/models/appActions.dart';

class PostToolbar extends StatelessWidget {
  final double? vertPadding;
  final double? horizPadding;
  const PostToolbar({Key? key, this.vertPadding = 16, this.horizPadding = 48})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: vertPadding!, horizontal: horizPadding!),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Spotlasicons.map_border),
          Icon(Spotlasicons.speech_bubble_border),
          GestureDetector(
            child: context.watch<AppActionsProvider>().liked
                ? Icon(Spotlasicons.heart)
                : Icon(Spotlasicons.heart_border),
            onTap: () => context.read<AppActionsProvider>().like(),
          ),
          Icon(Spotlasicons.paper_plane_border),
        ],
      ),
    );
  }
}
