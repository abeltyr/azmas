import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Account/birthDateInput.dart';
import 'package:azmas/Widgets/Account/genderInput.dart';
import 'package:azmas/Widgets/Shared/Button/index.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

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
                  width: (MediaQuery.of(context).size.width - 90) / 2,
                  child: AzmasButton(
                    onClick: backAction,
                    title: "Back",
                    color: PlatformTheme.textColor2,
                    borderRadiusData: 15,
                  ),
                ),
                Container(
                  height: 40,
                  width: (MediaQuery.of(context).size.width - 90) / 2,
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
