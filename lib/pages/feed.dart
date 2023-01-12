import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotlas_code_challenge/components/post.dart';
import 'package:spotlas_code_challenge/models/feed_data.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<FeedData>().fetchData;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            'Feed',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {},
          child: Center(
            child: Consumer<FeedData>(
              builder: ((context, value, child) {
                return value.map.length == 0 && !value.error
                    ? CircularProgressIndicator()
                    : value.error
                        ? Text(
                            'Something went wrong. ${value.errorMessage}',
                            textAlign: TextAlign.center,
                          )
                        : ListView.builder(
                            itemCount: value.map.length,
                            itemBuilder: (context, index) {
                              // print(index);
                              // print(value.map[index]);
                              return Post(
                                map: value.map[index],
                              );
                            });
              }),
            ),
          ),
        ));
  }
}

// ListView(
//             shrinkWrap: true,
//             children: <Widget>[
//               Post(),
//             ],
//           ),