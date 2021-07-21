import 'package:azmas/Utils/inputTheme.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Shared/Button/index.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class SecuritySettings extends StatefulWidget {
  @override
  _SecuritySettingsState createState() => _SecuritySettingsState();
}

class _SecuritySettingsState extends State<SecuritySettings> {
  bool validationCheck = false;
  bool loading = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _oldPasswordController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _oldPasswordController = new TextEditingController();
    _passwordController = new TextEditingController();
    _confirmPasswordController = new TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _oldPasswordController.dispose();
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
                controller: _oldPasswordController,
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
                decoration:
                    InputTheme().textInputDecoration(label: "Old Password"),
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
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _passwordController,
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
                controller: _confirmPasswordController,
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
                  if (value != _passwordController.text) {
                    return "The passwords don't match";
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
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
