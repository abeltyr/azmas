import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class InteractionProvider with ChangeNotifier {
  bool _isError = false;
  bool _viewAble = false;

  bool get viewAble {
    return _viewAble;
  }

  bool get isError {
    return _isError;
  }

  void updateViewAble() {
    _viewAble = !_viewAble;
    notifyListeners();
  }

  void error({required bool errorData}) {
    _isError = errorData;
    notifyListeners();
  }
}
