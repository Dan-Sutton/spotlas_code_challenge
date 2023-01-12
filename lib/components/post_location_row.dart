import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotlas_code_challenge/icons/spotlasicons_icons.dart';
import 'package:spotlas_code_challenge/models/appActions.dart';

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
                    padding: EdgeInsets.only(right: 12.0),
                    child: CircleAvatar(
                      radius: 32,
                      backgroundColor: Color.fromRGBO(255, 0, 106, 1),
                      child: CircleAvatar(
                        radius: 27,
                        backgroundImage: NetworkImage(spot['logo']['url']),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 2),
                        child: Text(
                          spot['name'],
                          style: TextStyle(
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
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 16),
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
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 16),
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
            onTap: () => context.read<AppActionsProvider>().save(),
            child: context.watch<AppActionsProvider>().saved
                ? const Icon(
                    Spotlasicons.star,
                    size: 35,
                    color: Color.fromRGBO(255, 195, 0, 1),
                  )
                : const Icon(
                    Spotlasicons.star_border,
                    size: 35,
                    color: Colors.white,
                  ),
          )
        ],
      ),
    );
  }
}
