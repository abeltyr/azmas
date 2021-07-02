import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TransactionPropsProvider with ChangeNotifier {
  bool _transctionTab = true;
  bool _isError = false;

  bool get transctionTab {
    return _transctionTab;
  }

  bool get isError {
    return _isError;
  }

  void updateTransctionTab() {
    _transctionTab = !_transctionTab;
    notifyListeners();
  }

  void error({required bool errorData}) {
    _isError = errorData;
    notifyListeners();
  }
}
