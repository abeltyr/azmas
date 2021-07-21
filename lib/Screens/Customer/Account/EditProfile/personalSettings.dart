import 'package:azmas/Model/User/index.dart';
import 'package:azmas/Utils/inputTheme.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Account/birthDateInput.dart';
import 'package:azmas/Widgets/Account/genderInput.dart';
import 'package:azmas/Widgets/Shared/Button/index.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class PersonalSettings extends StatefulWidget {
  @override
  _PersonalSettingsState createState() => _PersonalSettingsState();
}

class _PersonalSettingsState extends State<PersonalSettings> {
  bool validationCheck = false;
  bool loading = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _fullNameController;
  late TextEditingController _genderController;
  late TextEditingController _birthDateController;
  late TextEditingController _birthDateRealValueController;
  late TextEditingController _userNameController;
  final userProfile = Hive.box<UserModel>('users');

  @override
  void initState() {
    super.initState();
    var user = userProfile.get("currentUser");
    String birthDate = DateTime.now().toString();
    DateTime birthDateDetail = DateTime.parse(birthDate);
    if (user != null) {
      birthDate = user.birthDate!;
      birthDateDetail = DateTime.parse(birthDate);
    }
    _fullNameController = new TextEditingController(text: user!.fullName);
    _genderController = new TextEditingController(text: user.gender);
    _birthDateController = new TextEditingController(
        text: DateFormat.yMd().format(birthDateDetail));
    _birthDateRealValueController =
        new TextEditingController(text: birthDateDetail.toString());
  }

  @override
  void dispose() {
    super.dispose();
    _fullNameController.dispose();
    _genderController.dispose();
    _birthDateController.dispose();
    _birthDateRealValueController.dispose();
  }

  void keyboardDown() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Form(
          key: _formKey,
          autovalidateMode: validationCheck
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          onChanged: () {},
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _fullNameController,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.done,
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
                    InputTheme().textInputDecoration(label: "Full Name"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This is a required field';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              BirthDateInput(
                birthDateController: _birthDateController,
                birthDateRealValueController: _birthDateRealValueController,
              ),
              SizedBox(height: 15),
              GenderInput(
                genderController: _genderController,
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 40,
                  width: 150,
                  child: AzmasButton(
                    onClick: () {
                      keyboardDown();
                      setState(() {
                        validationCheck = true;
                      });
                      if (_formKey.currentState!.validate()) {
                        //TODO: add the api here
                        var user = userProfile.get("currentUser");

                        user!.userName = _userNameController.text;
                        user.fullName = _fullNameController.text;
                        user.gender = _genderController.text;
                        user.birthDate = _birthDateRealValueController.text;
                        userProfile.put(
                          "currentUser",
                          user,
                        );
                      }
                    },
                    title: "Save",
                    color: PlatformTheme.textColor1,
                    borderRadiusData: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
