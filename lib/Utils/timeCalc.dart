import 'package:intl/intl.dart';

class TimeCalc {
  String dateDifference(DateTime date) {
    var now = DateTime.now();
    if (now.difference(date).inSeconds <= 60)
      return "${now.difference(date).inSeconds} sec ago";
    else if (now.difference(date).inMinutes <= 60)
      return "${now.difference(date).inMinutes} min ago";
    else if (now.difference(date).inHours <= 24)
      return "${now.difference(date).inHours}h ago";
    else if (now.difference(date).inDays < 5)
      return "${now.difference(date).inDays} day${now.difference(date).inDays == 1 ? "" : "s"} ago";
    else
      return DateFormat.yMMMd().format(date).toString();
  }
}
