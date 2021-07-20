import 'package:azmas/Utils/inputTheme.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Shared/Button/index.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class SignUpForm4 extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final Function action;
  final Function backAction;
  final bool loading;

  final bool check;
  SignUpForm4({
    required this.formKey,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.action,
    required this.backAction,
    required this.check,
    required this.loading,
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
              controller: passwordController,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.done,
              maxLines: 1,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              style: GoogleFonts.lora(
                color: PlatformTheme.secondaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 18,
                wordSpacing: 0.1,
              ),
              cursorColor: PlatformTheme.accentColorDark,
              decoration: InputTheme().textInputDecoration(label: "Password"),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'This is a required field';
                }
                if (value.length < 8) {
                  return 'The password is to short';
                }
                return null;
              },
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: confirmPasswordController,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.go,
              maxLines: 1,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              style: GoogleFonts.lora(
                color: PlatformTheme.secondaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 18,
                wordSpacing: 0.1,
              ),
              cursorColor: PlatformTheme.accentColorDark,
              decoration:
                  InputTheme().textInputDecoration(label: "Confirm Password"),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'This is a required field';
                }
                if (value != passwordController.text) {
                  return "The passwords don't match";
                }
                return null;
              },
            ),
            SizedBox(height: 15),
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
                    loading: loading,
                    onClick: backAction,
                    title: "Back",
                    color: PlatformTheme.textColor2,
                    borderRadiusData: 7.5,
                  ),
                ),
                Container(
                  height: 40,
                  width: 150,
                  child: AzmasButton(
                    onClick: action,
                    loading: loading,
                    title: "Sign Up",
                    color: PlatformTheme.positive,
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
