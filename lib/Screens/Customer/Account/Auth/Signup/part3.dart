import 'package:azmas/Utils/inputTheme.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Shared/Button/index.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class SignUpForm3 extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController instaController;
  final TextEditingController twitterController;
  final TextEditingController telegramController;
  final Function action;
  final Function backAction;
  final bool check;
  SignUpForm3({
    required this.formKey,
    required this.instaController,
    required this.twitterController,
    required this.telegramController,
    required this.action,
    required this.backAction,
    required this.check,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Form(
        key: formKey,
        autovalidateMode:
            check ? AutovalidateMode.always : AutovalidateMode.disabled,
        onChanged: () {},
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: instaController,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.next,
              maxLines: 1,
              enableSuggestions: false,
              autocorrect: false,
              style: GoogleFonts.lora(
                color: PlatformTheme.textColor1,
                fontWeight: FontWeight.w600,
                fontSize: 18,
                wordSpacing: 0.1,
              ),
              cursorColor: PlatformTheme.accentColorDark,
              decoration:
                  InputTheme().textInputDecoration(label: "Instagram Username"),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'This is a required field';
                }
                return null;
              },
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: twitterController,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.next,
              maxLines: 1,
              enableSuggestions: false,
              autocorrect: false,
              style: GoogleFonts.lora(
                color: PlatformTheme.textColor1,
                fontWeight: FontWeight.w600,
                fontSize: 18,
                wordSpacing: 0.1,
              ),
              cursorColor: PlatformTheme.accentColorDark,
              decoration:
                  InputTheme().textInputDecoration(label: "Twitter Username"),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'This is a required field';
                }
                return null;
              },
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: telegramController,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.go,
              maxLines: 1,
              enableSuggestions: false,
              autocorrect: false,
              style: GoogleFonts.lora(
                color: PlatformTheme.textColor1,
                fontWeight: FontWeight.w600,
                fontSize: 18,
                wordSpacing: 0.1,
              ),
              cursorColor: PlatformTheme.accentColorDark,
              decoration:
                  InputTheme().textInputDecoration(label: "Telegram Username"),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'This is a required field';
                }
                return null;
              },
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 150,
                  child: AzmasButton(
                    onClick: backAction,
                    title: "Back",
                    color: PlatformTheme.textColor2,
                    borderRadiusData: 15,
                  ),
                ),
                Container(
                  height: 40,
                  width: 150,
                  child: AzmasButton(
                    onClick: action,
                    title: "Next",
                    color: PlatformTheme.textColor1,
                    borderRadiusData: 15,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
