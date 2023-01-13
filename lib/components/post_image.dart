import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotlas_code_challenge/components/post_location_row.dart';
import 'package:spotlas_code_challenge/components/post_user_row.dart';
import 'package:spotlas_code_challenge/icons/spotlasicons_icons.dart';
import 'package:spotlas_code_challenge/models/feed_data.dart';

class PostImage extends StatefulWidget {
  final List images;
  final Map<String, dynamic> author;
  final Map<String, dynamic> spot;
  final String id;

  const PostImage(
      {Key? key,
      required this.images,
      required this.author,
      required this.spot,
      required this.id})
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
    context.read<FeedData>().likeImage(widget.id);
    Future.delayed(Duration(milliseconds: 220)).then(
      (_) => setState(() {
        showLike = false;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool loading = false;
    return Stack(
      children: [
        GestureDetector(
            onDoubleTap: () => likePost(),
            child: CarouselSlider.builder(
                itemCount: widget.images.length,
                itemBuilder: (context, index, realIndex) {
                  final image = widget.images[index]['url'];
                  return Image.network(image,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover, frameBuilder:
                          (context, child, frame, wasSynchronouslyLoaded) {
                    return child;
                  }, loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  });
                },
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  viewportFraction: 1,
                  height: 580,
                ))),
        if (!loading)
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: PostUserRow(
              author: {...widget.author},
            ),
          ),
        if (!loading)
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
            child: Icon(Spotlasicons.heart,
                size: 85, color: Color.fromRGBO(255, 0, 106, 1)),
          ),
      ],
    );
  }
}
