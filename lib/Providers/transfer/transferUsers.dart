import 'package:azmas/Model/user.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class TransferUsersProvider with ChangeNotifier {
  bool _showUser = false;
  String _transfer = "0";
  String _innerTransfer = "0";
  NumberFormat numberFormat = NumberFormat('#,###,000');
  List<UserModel> _transferUser = [
    UserModel(
      id: "0",
      firstName: "Mike",
      lastName: "LastName",
      account: "**8102",
      avatar: "assets/images/user1.jpeg",
    ),
    UserModel(
      id: "1",
      firstName: "Eyob",
      lastName: "LastName",
      avatar: "assets/images/user2.jpeg",
      account: "**6702",
    ),
    UserModel(
      id: "2",
      firstName: "Rediet",
      lastName: "LastName",
      avatar: "assets/images/user5.jpeg",
      account: "**1702",
    ),
    UserModel(
      id: "3",
      firstName: "Soli",
      lastName: "LastName",
      avatar: "assets/images/user6.jpeg",
      account: "**6212",
    ),
    UserModel(
      id: "3",
      firstName: "Davi",
      lastName: "LastName",
      avatar: "assets/images/user7.jpeg",
      account: "**2322",
    ),
    UserModel(
      id: "4",
      firstName: "Nati",
      lastName: "LastName",
      avatar: "assets/images/user4.jpeg",
      account: "**3892",
    ),
    UserModel(
      id: "5",
      firstName: "Tom",
      lastName: "LastName",
      avatar: "assets/images/user3.jpeg",
      account: "**8276",
    ),
  ];

  List<UserModel> get transferUser {
    return _transferUser;
  }

  bool get showUser {
    return _showUser;
  }

  String get transfer {
    return _transfer;
  }

  int get innerTransfer {
    return int.parse(_innerTransfer);
  }

  void updateShowUser(bool value) {
    _showUser = value;
    notifyListeners();
  }

  void resetData() {
    _transfer = "0";
    _innerTransfer = "0";
  }

  void updateTransfer(String data) {
    if (_innerTransfer == "0")
      _innerTransfer = data;
    else
      _innerTransfer = _innerTransfer + data;
    if (_innerTransfer.length > 3)
      _transfer = numberFormat.format(int.parse(_innerTransfer));
    else
      _transfer = _innerTransfer;
    notifyListeners();
  }

  void removeTransfer() {
    if (_innerTransfer.length <= 1)
      _innerTransfer = "0";
    else
      _innerTransfer = _innerTransfer.substring(0, _innerTransfer.length - 1);

    if (_innerTransfer.length > 3)
      _transfer = numberFormat.format(int.parse(_innerTransfer));
    else
      _transfer = _innerTransfer;
    notifyListeners();
  }
}
