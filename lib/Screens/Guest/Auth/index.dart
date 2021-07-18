import 'package:azmas/Providers/user/index.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AuthIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Provider.of<UserProvider>(context, listen: false).login();
            },
            child: Text(
              "Auth",
              textAlign: TextAlign.center,
              style: GoogleFonts.lora(
                color: PlatformTheme.secondaryColor,
                fontWeight: FontWeight.w800,
                fontSize: 22,
                wordSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
