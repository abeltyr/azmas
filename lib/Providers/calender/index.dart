import 'package:azmas/Model/calender.dart';
import 'package:flutter/foundation.dart';

class CalenderProvider with ChangeNotifier {
  List<CalenderModel> _months = [];
  int _selectedMonths = 0;

  int get selectedMonths {
    return _selectedMonths;
  }

  List<CalenderModel> get months {
    return _months;
  }

  Future<List<CalenderModel>> getMonths() async {
    _months = [];
    final dateTime = DateTime.now();
    final date = dateTime.month;
    for (var i = 0; i < 12; i++) {
      final int nowDate = date + i;
      if (date + i <= 12) {
        _months = [
          ..._months,
          CalenderModel(
            month: changeData(
              nowDate,
            ),
            year: "${dateTime.year}",
          )
        ];
      } else
        _months = [
          ..._months,
          CalenderModel(
            month: changeData(
              nowDate - 12,
            ),
            year: "${dateTime.year + 1}",
          )
        ];
    }
    return _months;
  }

  String changeData(int data) {
    if (data < 10) {
      return "0$data";
    } else
      return "$data";
  }

  void updateMonth(int data) {
    _selectedMonths = data;
    notifyListeners();
  }
}
