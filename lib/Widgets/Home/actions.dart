import 'package:azmas/Widgets/card/actionCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ActionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ActionCardWidget(
            title: AppLocalizations.of(context)!.transfer,
            svgData: "assets/icons/Send.svg",
          ),
          ActionCardWidget(
            title: AppLocalizations.of(context)!.payments,
            svgData: "assets/icons/Wallet.svg",
          ),
          ActionCardWidget(
            title: AppLocalizations.of(context)!.services,
            svgData: "assets/icons/Buy.svg",
          ),
          ActionCardWidget(
            title: AppLocalizations.of(context)!.tickets,
            svgData: "assets/icons/Ticket.svg",
          ),
        ],
      ),
    );
  }
}
