import 'package:azmas/Utils/inputTheme.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Account/birthDateInput.dart';
import 'package:azmas/Widgets/Account/genderInput.dart';
import 'package:azmas/Widgets/Shared/Button/index.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class SignUpForm2 extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController birthDateController;
  final TextEditingController birthDateRealValueController;
  final TextEditingController genderController;
  final Function action;
  final Function backAction;
  final bool check;
  SignUpForm2({
    required this.formKey,
    required this.birthDateController,
    required this.birthDateRealValueController,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            BirthDateInput(
              birthDateController: birthDateController,
              birthDateRealValueController: birthDateRealValueController,
            ),
            SizedBox(height: 15),
            GenderInput(
              genderController: genderController,
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
