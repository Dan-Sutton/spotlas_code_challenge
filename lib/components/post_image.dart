import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotlas_code_challenge/components/post_location_row.dart';
import 'package:spotlas_code_challenge/components/post_user_row.dart';
import 'package:spotlas_code_challenge/icons/spotlasicons_icons.dart';

import '../models/appActions.dart';

class PostImage extends StatefulWidget {
  final List images;
  final Map<String, dynamic> author;
  final Map<String, dynamic> spot;

  const PostImage(
      {Key? key,
      required this.images,
      required this.author,
      required this.spot})
      : super(key: key);

  @override
  _PostImageState createState() => _PostImageState();
}

class _PostImageState extends State<PostImage> {
  bool showLike = false;

  likePost() {
    setState(() {
      showLike = true;
    });
    context.read<AppActionsProvider>().like();
    Future.delayed(Duration(milliseconds: 220)).then(
      (_) => setState(() {
        showLike = false;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
            onDoubleTap: () => likePost(),
            child: CarouselSlider.builder(
                itemCount: widget.images.length,
                itemBuilder: (context, index, realIndex) {
                  final image = widget.images[index]['url'];
                  return Image.network(
                    image,

                    // width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  );
                },
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  viewportFraction: 1,
                  height: 687,
                ))),
        Padding(
          padding: EdgeInsets.only(top: 12),
          child: PostUserRow(
            author: {...widget.author},
          ),
        ),
        Positioned(
          left: 1,
          right: 1,
          bottom: 0,
          child: Padding(
            padding: EdgeInsets.only(bottom: 12.0),
            child: PostLocationRow(
              spot: {...widget.spot},
            ),
          ),
        ),
        if (showLike)
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Icon(
              Spotlasicons.heart,
              size: 85,
              color: Colors.red,
            ),
          ),
      ],
    );
  }
}
