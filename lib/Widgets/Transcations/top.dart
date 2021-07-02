import 'package:azmas/Providers/interaction/Transctions.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TransactionTopWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transactionProps =
        Provider.of<TransactionPropsProvider>(context, listen: true);
    return Container(
      margin: EdgeInsets.only(top: 40),
      height: 50,
      child: Stack(
        children: [
          Positioned(
            top: 10,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                !transactionProps.transctionTab
                    ? AppLocalizations.of(context)!.analysis
                    : AppLocalizations.of(context)!.transactions,
                textAlign: TextAlign.center,
                style: GoogleFonts.lora(
                  color: PlatformTheme.accentColorDark,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Positioned(
            left: 1,
            child: GestureDetector(
              child: Container(
                width: 50,
                height: 50,
                color: Colors.transparent,
                child: Icon(
                  CupertinoIcons.left_chevron,
                  size: 25,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
