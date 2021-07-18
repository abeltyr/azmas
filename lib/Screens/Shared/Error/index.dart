import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Shared/Button/index.dart';
import 'package:azmas/Widgets/Shared/empty.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorScreen extends StatelessWidget {
  static const routeName = "/error";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              AnimationWidget(
                assetData: 'assets/Animations/404Error.json',
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "Some Thing Went Wrong. Let Go Back Home",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lora(
                    color: PlatformTheme.textColor2,
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    wordSpacing: 1,
                    height: 2,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                height: 50,
                child: AzmasButton(
                  color: PlatformTheme.iconColor,
                  onClick: () {
                    Navigator.of(context).popUntil(ModalRoute.withName('/'));
                  },
                  title: "Go Home",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
