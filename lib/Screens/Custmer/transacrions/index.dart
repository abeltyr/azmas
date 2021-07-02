import 'package:azmas/Providers/transfer/index.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Transcations/bottom.dart';
import 'package:azmas/Widgets/Transcations/top.dart';
import 'package:azmas/Widgets/card/transctionCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionScreens extends StatelessWidget {
  static const routeName = "/transactions";

  @override
  Widget build(BuildContext context) {
    final transactions = Provider.of<TransferProvider>(context, listen: true);

    Widget transactionsWidget() {
      return Container(
        height: MediaQuery.of(context).size.height - 90,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: transactions.allTransactions.length + 1,
          itemBuilder: (context, index) {
            if (transactions.allTransactions.length == index)
              return SizedBox(
                height: 100,
              );
            return ExpenseCardWidget(transactions.allTransactions[index]);
          },
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: PlatformTheme.white,
            child: Column(
              children: [
                TransactionTopWidget(),
                transactionsWidget(),
              ],
            ),
          ),
          TransctionBottomWidget(),
        ],
      ),
    );
  }
}
