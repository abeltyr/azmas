import 'package:azmas/Model/transaction.dart';
import 'package:azmas/Providers/transfer/index.dart';
import 'package:azmas/Widgets/card/transctionCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransctionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<TransferProvider>(context, listen: false)
          .getTransctions(),
      builder: (context, dataSnap) {
        List<TransactionsModel> transactions = [];
        if (dataSnap.data != null && dataSnap.hasData) {
          final transactionProvider =
              Provider.of<TransferProvider>(context, listen: true);
          transactions = transactionProvider.transactions;
          return Container(
            height: transactions.length * 85,
            width: double.infinity,
            child: Column(
                children: transactions.map((TransactionsModel transction) {
              return ExpenseCardWidget(transction);
            }).toList()),
          );
        } else
          return Container();
      },
    );
  }
}
