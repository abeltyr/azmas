import 'package:azmas/Model/transaction.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ExpenseCardWidget extends StatelessWidget {
  final TransactionsModel transcation;

  ExpenseCardWidget(this.transcation);

  @override
  Widget build(BuildContext context) {
    NumberFormat numberFormat = NumberFormat('#,###,000');
    return Container(
      height: 75,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      width: double.infinity,
      child: Row(
        children: [
          if (transcation.serviceType == SerivceType.Deposite ||
              transcation.serviceType == SerivceType.Withdraw)
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: PlatformTheme.secondaryColorLight,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              child: SvgPicture.asset(
                transcation.logo,
                fit: BoxFit.cover,
                color: PlatformTheme.white,
              ),
            )
          else if (transcation.serviceType == SerivceType.Transfer)
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  transcation.logo,
                  width: 70,
                  height: 70,
                  fit: BoxFit.fill,
                ),
              ),
            )
          else
            Container(
              width: 70,
              height: 70,
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: PlatformTheme.secondaryColorLight,
              ),
              child: Image.asset(
                transcation.logo,
                fit: BoxFit.contain,
              ),
            ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Container(
              height: 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${transcation.title}",
                    style: GoogleFonts.lora(
                      color: PlatformTheme.secondaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${DateFormat.MMMd().format(transcation.transactionDate)}, ${DateFormat.jm().format(transcation.transactionDate)}",
                    style: GoogleFonts.lora(
                      color: PlatformTheme.primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 95,
            height: 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    "${transcation.transcationtype == Transactiontype.Negative ? "-" : "+"}${transcation.amount >= 1000 ? numberFormat.format(transcation.amount) : transcation.amount} ETB",
                    style: GoogleFonts.lora(
                      color: transcation.transcationtype ==
                              Transactiontype.Negative
                          ? PlatformTheme.negative
                          : PlatformTheme.positive,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                if (transcation.serviceType == SerivceType.Transfer)
                  Text(
                    "Transfer",
                    style: GoogleFonts.lora(
                      color: PlatformTheme.accentColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                if (transcation.serviceType == SerivceType.Subscription)
                  Text(
                    "Subscription",
                    style: GoogleFonts.lora(
                      color: PlatformTheme.accentColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                if (transcation.serviceType == SerivceType.Deposite)
                  Text(
                    "Saving",
                    style: GoogleFonts.lora(
                      color: PlatformTheme.accentColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                if (transcation.serviceType == SerivceType.Withdraw)
                  Text(
                    "ATM Withdraw",
                    style: GoogleFonts.lora(
                      color: PlatformTheme.accentColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                if (transcation.serviceType == SerivceType.Bill)
                  Text(
                    "Bill Payment",
                    style: GoogleFonts.lora(
                      color: PlatformTheme.accentColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
