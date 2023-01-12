import 'package:spotlas_code_challenge/components/post.dart';

extension PostHelpers on Post {
  String get dateTimePosted => formatDateTimePosted(map['created_at']);

  formatDateTimePosted(dateTime) {
    print(dateTime);
    return 'Bob';
  }
}
