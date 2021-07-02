import 'package:azmas/Model/transaction.dart';
import 'package:flutter/foundation.dart';

class TransferProvider with ChangeNotifier {
  List<TransactionsModel> _transactions = [];

  List<TransactionsModel> get transactions {
    return _transactions.sublist(0, 4);
  }

  List<TransactionsModel> get allTransactions {
    return _transactions;
  }

  Future<List<TransactionsModel>> getTransctions() async {
    DateTime dateData = DateTime.now();
    int date = dateData.day - 1;
    int month = dateData.month;
    int year = dateData.year;

    if (date == 0) {
      date = 30;
      month = month - 1;
      if (month == 0) {
        month = 12;
        year = year - 1;
      }
    }
    if (_transactions.length == 0)
      _transactions = [
        TransactionsModel(
          id: "-1",
          amount: 4000,
          logo: "assets/images/user1.jpeg",
          title: "Mike Father",
          transactionDate: DateTime.utc(year, month, date, 12, 23, 45),
          serviceType: SerivceType.Transfer,
          transcationtype: Transactiontype.Positive,
        ),
        TransactionsModel(
          id: "0",
          amount: 1899,
          logo: "assets/images/user5.jpeg",
          title: "Rediet Father",
          transactionDate: DateTime.utc(year, month, date, 08, 23, 45),
          serviceType: SerivceType.Transfer,
        ),
        TransactionsModel(
          id: "3",
          amount: 3500,
          logo: "assets/images/brands/ethiotele.png",
          title: "Ethio Telecome",
          transactionDate: DateTime.utc(year, month, date, 07, 29, 45),
          serviceType: SerivceType.Bill,
        ),
        TransactionsModel(
          id: "1",
          amount: 8.99,
          logo: "assets/images/brands/netflix.png",
          title: "Netflix",
          transactionDate: DateTime.utc(year, month, date, 06, 43, 45),
          serviceType: SerivceType.Subscription,
        ),
        TransactionsModel(
          id: "2",
          amount: 500,
          logo: "assets/icons/MoneyBag.svg",
          title: "Money Deposit",
          transcationtype: Transactiontype.Positive,
          transactionDate: DateTime.utc(year, month, date, 05, 13, 45),
          serviceType: SerivceType.Deposite,
        ),
        TransactionsModel(
          id: "4",
          amount: 9.99,
          logo: "assets/images/brands/spotify.png",
          title: "Spotify",
          transactionDate: DateTime.utc(year, month, date, 3, 19, 45),
          serviceType: SerivceType.Subscription,
        ),
        TransactionsModel(
          id: "5",
          amount: 100,
          logo: "assets/icons/Withdraw1.svg",
          title: "Money Widthdraw",
          transactionDate: DateTime.utc(year, month, date, 1, 36, 45),
          serviceType: SerivceType.Withdraw,
        ),
      ];

    return _transactions;
  }

  Future<void> addTransaction({required TransactionsModel transaction}) async {
    _transactions.insert(0, transaction);
    notifyListeners();
  }
}
