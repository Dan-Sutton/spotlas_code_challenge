import 'package:flutter/material.dart';
import 'package:spotlas_code_challenge/icons/spotlasicons_icons.dart';

class PostUserRow extends StatelessWidget {
  final Map<String, dynamic> author;
  const PostUserRow({Key? key, required this.author}) : super(key: key);

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
                          backgroundImage: NetworkImage(author['photo_url']),
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
                          author['username'],
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
                      Text(
                        author['full_name'],
                        style: TextStyle(
                            shadows: <Shadow>[
                              Shadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 7,
                              )
                            ],
                            color: Colors.grey[100],
                            fontWeight: FontWeight.w600,
                            fontSize: 17),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          Icon(
            Spotlasicons.options,
            size: 30,
            color: Colors.white,
            shadows: <Shadow>[
              Shadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 7,
              )
            ],
          )
        ],
      ),
    );
  }
}
