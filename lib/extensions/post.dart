import 'package:spotlas_code_challenge/components/post.dart';

extension PostHelpers on Post {
  String get dateTimePosted => formatDateTimePosted(map['created_at']);

  formatDateTimePosted(dateTime) {
    DateTime now = DateTime.now();
    DateTime other = DateTime.parse(dateTime);

    //? Demo date
    // DateTime other = DateTime.parse("2023-01-12T19:57:28.947828Z");
    //?

    int difference = (now.difference(other).inDays).toInt();

    if (difference == 0) {
      int hourDifference = (now.difference(other).inHours).toInt();
      if (hourDifference == 0) {
        int minuteDifference = (now.difference(other).inMinutes).toInt();
        return '${(now.difference(other).inMinutes)} ${minuteDifference == 1 ? "minute" : "minutes"} ago';
      } else {
        return '${(now.difference(other).inHours)} ${hourDifference == 1 ? "hour" : "hours"} ago';
      }
    } else {
      return '${difference.toString()} ${difference == 1 ? "day" : "days"} ago';
    }
  }
}
