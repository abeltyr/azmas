import 'package:azmas/Screens/Customer/Account/Ticket/ticketDetail.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Ticket/ticketCard.dart';
import 'package:azmas/Widgets/Ticket/topBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class TicketScreen extends StatelessWidget {
  static const routeName = "/ticket";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PlatformTheme.primaryColor,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 85),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                GestureDetector(
                    onTap: () {
                      showCupertinoModalBottomSheet(
                        context: context,
                        builder: (context) => TicketDetail(),
                      );
                    },
                    child: TicketCard()),
              ],
            ),
          ),
          TicketTopBar(),
        ],
      ),
    );
  }
}
