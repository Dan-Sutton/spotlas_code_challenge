import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotlas_code_challenge/icons/spotlasicons_icons.dart';
import 'package:spotlas_code_challenge/models/feed_data.dart';

class PostLocationRow extends StatelessWidget {
  final Map<String, dynamic> spot;
  const PostLocationRow({Key? key, required this.spot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Container(
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 3,
                        ),
                      ]),
                      child: CircleAvatar(
                        radius: 31,
                        backgroundColor: const Color.fromRGBO(255, 0, 106, 1),
                        child: CircleAvatar(
                          radius: 27,
                          backgroundImage: NetworkImage(spot['logo']['url']),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Text(
                          spot['name'],
                          style: TextStyle(
                              shadows: <Shadow>[
                                Shadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 7,
                                )
                              ],
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            spot['types'][0]['name'],
                            style: TextStyle(
                                shadows: <Shadow>[
                                  Shadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 7,
                                  )
                                ],
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 17),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Container(
                              width: 4.0,
                              height: 4.0,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                            ),
                          ),
                          Text(
                            spot['location']['display'],
                            style: TextStyle(
                                color: Colors.grey[100],
                                fontWeight: FontWeight.w600,
                                fontSize: 17),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () => context.read<FeedData>().saveLocation(spot['id']),
            child: spot['is_saved']
                ? Icon(
                    Spotlasicons.star,
                    size: 34,
                    color: Color.fromRGBO(255, 195, 0, 1),
                    shadows: <Shadow>[
                      Shadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 7,
                      )
                    ],
                  )
                : Icon(
                    Spotlasicons.star_border,
                    size: 34,
                    shadows: <Shadow>[
                      Shadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 7,
                      )
                    ],
                    color: Colors.white,
                  ),
          )
        ],
      ),
    );
  }
}
