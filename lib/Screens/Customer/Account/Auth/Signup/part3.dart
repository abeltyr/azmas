import 'package:azmas/Utils/inputTheme.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Shared/Button/index.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class SignUpForm3 extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController fullNameController;
  final TextEditingController phoneNumberController;
  final Function action;
  final Function onInputChanged;
  final String countryCode;
  final bool check;
  SignUpForm3({
    required this.formKey,
    required this.fullNameController,
    required this.emailController,
    required this.phoneNumberController,
    required this.action,
    required this.onInputChanged,
    required this.check,
    required this.countryCode,
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
              controller: fullNameController,
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
              controller: phoneNumberController,
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
            SizedBox(height: 15),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
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
                  InputTheme().textInputDecoration(label: "Email Address"),
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regex = new RegExp(pattern);
                if (value!.isEmpty) {
                  return 'This is a required field';
                }
                if (!regex.hasMatch(value)) {
                  return 'Please provided a valid Email';
                }
                return null;
              },
            ),
            SizedBox(height: 25),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 40,
                width: 150,
                child: AzmasButton(
                  onClick: action,
                  title: "Next",
                  color: PlatformTheme.secondaryColorLight,
                  borderRadiusData: 7.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
