import 'package:azmas/Providers/interaction/Transctions.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TransctionBottomWidget extends StatefulWidget {
  @override
  _TransctionBottomWidgetState createState() => _TransctionBottomWidgetState();
}

class _TransctionBottomWidgetState extends State<TransctionBottomWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final transactionProps =
        Provider.of<TransactionPropsProvider>(context, listen: true);
    return GestureDetector(
      onTap: () {
        transactionProps.updateTransctionTab();
        if (!transactionProps.transctionTab)
          _controller.forward();
        else
          _controller.reverse();
      },
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                color: PlatformTheme.thirdColor,
                borderRadius: BorderRadius.circular(15)),
            margin: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 25,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  transactionProps.transctionTab
                      ? AppLocalizations.of(context)!.analysis
                      : AppLocalizations.of(context)!.transactions,
                  style: GoogleFonts.lora(
                    color: PlatformTheme.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                RotationTransition(
                  turns: Tween(begin: 0.0, end: 0.5).animate(_controller),
                  child: SvgPicture.asset(
                    "assets/icons/Swap.svg",
                    color: PlatformTheme.white,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
