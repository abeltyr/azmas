import 'package:flutter/foundation.dart';

class CountDownProvider with ChangeNotifier {
  Map<String, dynamic>? _countDownDate;

  void counterDone() {
    _countDownDate!["done"] = true;
    notifyListeners();
  }

  Future<Map<String, dynamic>?> getCountDownDate() async {
    String date = "2021-10-17";
    // String date = "2021-07-22 20:31";
    final mainDay = DateTime.parse(date);
    final toDayDate = DateTime.now();
    bool done = mainDay.isBefore(toDayDate);
    _countDownDate = {
      "date": date,
      "done": done,
    };

    var difference = mainDay.difference(toDayDate);
    if (done && difference.inDays < 0)
      return null;
    else
      return _countDownDate;
  }
}
