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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Feed',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            context.read<FeedData>().fetchData;
          },
          child: Center(
            child: Consumer<FeedData>(
              builder: ((context, value, child) {
                return value.map.isEmpty && !value.error
                    ? const CircularProgressIndicator()
                    : value.error
                        ? Text(
                            'Something went wrong. ${value.errorMessage}',
                            textAlign: TextAlign.center,
                          )
                        : ListView.builder(
                            itemCount: value.map.length,
                            itemBuilder: (context, index) {
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
