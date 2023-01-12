import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotlas_code_challenge/models/feed_data.dart';
import 'package:spotlas_code_challenge/pages/feed.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spotlas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        builder: (context, child) => const Feed(),
        create: (context) => FeedData(),
      ),
    );
  }
}
