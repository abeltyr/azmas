import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class QRScanPropsProvider with ChangeNotifier {
  bool _qrScan = false;

  bool get qrScan {
    return _qrScan;
  }

  void updateQRScan() {
    _qrScan = !_qrScan;
    notifyListeners();
  }
}
