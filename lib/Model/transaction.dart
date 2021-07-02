enum Transactiontype {
  Positive,
  Negative,
}
enum SerivceType { Subscription, Bill, Deposite, Withdraw, Transfer }

class TransactionsModel {
  String id;
  String logo;
  String title;
  double amount;
  Transactiontype transcationtype;
  SerivceType serviceType;
  DateTime transactionDate;

  TransactionsModel({
    required this.id,
    required this.logo,
    required this.title,
    required this.amount,
    required this.serviceType,
    this.transcationtype = Transactiontype.Negative,
    required this.transactionDate,
  });
}
