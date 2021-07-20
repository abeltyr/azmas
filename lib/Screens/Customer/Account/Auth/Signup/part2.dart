import 'package:azmas/Utils/inputTheme.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Shared/Button/index.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class SignUpForm2 extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController birthDateController;
  final TextEditingController genderController;
  final Function action;
  final Function backAction;

  final bool check;
  SignUpForm2({
    required this.formKey,
    required this.birthDateController,
    required this.genderController,
    required this.action,
    required this.backAction,
    required this.check,
  });
  Widget buttonText(String text) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      width: double.infinity,
      alignment: Alignment.center,
      child: Text(
        '$text',
        style: TextStyle(
          color: PlatformTheme.white,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

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
              controller: birthDateController,
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
              decoration: InputTheme().textInputDecoration(label: "Full Name"),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'This is a required field';
                }
                // if (value.length < 8) {
                //   return 'The password is to short';
                // }
                return null;
              },
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: genderController,
              keyboardType: TextInputType.phone,
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
                  InputTheme().textInputDecoration(label: "Phone number"),
              validator: (value) {
                String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                RegExp regExp = new RegExp(pattern);
                if (value!.length == 0) {
                  return 'Please enter mobile number';
                } else if (value.length <= 12) {
                  return 'Please enter valid mobile number';
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
                    color: PlatformTheme.thirdColorTransparent,
                    borderRadiusData: 7.5,
                  ),
                ),
                Container(
                  height: 40,
                  width: 150,
                  child: AzmasButton(
                    onClick: action,
                    title: "Next",
                    color: PlatformTheme.secondaryColorLight,
                    borderRadiusData: 7.5,
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