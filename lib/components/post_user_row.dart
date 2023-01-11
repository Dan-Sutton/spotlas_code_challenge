import 'package:flutter/material.dart';
import 'package:spotlas_code_challenge/icons/spotlasicons_icons.dart';

class PostUserRow extends StatelessWidget {
  const PostUserRow({Key? key}) : super(key: key);

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
                  const Padding(
                    padding: EdgeInsets.only(right: 12.0),
                    child: CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.red,
                      child: CircleAvatar(
                        radius: 27,
                        backgroundImage:
                            NetworkImage('https://picsum.photos/200'),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(bottom: 2),
                        child: Text(
                          'Username',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                      ),
                      Text(
                        'Name Name',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 16),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          const Icon(
            Spotlasicons.options,
            size: 35,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}