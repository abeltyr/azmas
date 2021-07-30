import 'package:azmas/Model/User/index.dart';
import 'package:azmas/Providers/user/index.dart';
import 'package:azmas/Utils/inAppNotification.dart';
import 'package:azmas/Utils/inputTheme.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Shared/Button/index.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class AccountSettings extends StatefulWidget {
  @override
  _AccountSettingsState createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  final userProfile = Hive.box<UserModel>('users');
  bool validationCheck = false;
  bool loading = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _userNameController;
  late TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();
    var user = userProfile.get("currentUser");
    _emailController = new TextEditingController(text: user!.email);
    _userNameController = new TextEditingController(text: user.userName);
    _phoneNumberController = new TextEditingController(text: user.phoneNumber);
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _userNameController.dispose();
    _phoneNumberController.dispose();
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
      color: PlatformTheme.primaryColor,
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
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
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
              SizedBox(height: 15),
              TextFormField(
                controller: _phoneNumberController,
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
                  if (value!.length == 0) {
                    return 'Please enter mobile number';
                  } else if (value.length <= 12) {
                    return 'Please enter valid mobile number';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _userNameController,
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
                decoration: InputTheme().textInputDecoration(label: "Username"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This is a required field';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 40,
                  width: 150,
                  child: AzmasButton(
                    onClick: () async {
                      keyboardDown();
                      setState(() {
                        validationCheck = true;
                      });
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });
                        try {
                          final res = await Provider.of<UserProvider>(context,
                                  listen: false)
                              .accountDataUpdate(
                            email: _emailController.text,
                            phoneNumber: _phoneNumberController.text,
                            userName: _userNameController.text,
                          );
                          if (!res) throw ("");

                          var user = userProfile.get("currentUser");

                          user!.userName = _userNameController.text;
                          user.email = _emailController.text;
                          user.phoneNumber = _phoneNumberController.text;

                          userProfile.put(
                            "currentUser",
                            user,
                          );
                          InAppNotification().showNotification(
                            context: context,
                            text: "Updated Your Account Data",
                            color: PlatformTheme.white,
                            repeat: false,
                            textColor: PlatformTheme.positive,
                            icon: "assets/Animations/GreenCheckMark.json",
                          );
                        } catch (e) {
                          String errorMessage =
                              "SomeThing Went Wrong. Please Try Again";
                          if (e.toString().contains(
                              "Unique constraint failed on the fields: (`phoneNumber`)"))
                            errorMessage = "The given phone number is taken";
                          else if (e.toString().contains(
                              "Unique constraint failed on the fields: (`email`)"))
                            errorMessage = "The given email is taken";
                          else if (e.toString().contains(
                              "Unique constraint failed on the fields: (`userName`)"))
                            errorMessage = "The given UserName is taken";

                          InAppNotification().showNotification(
                            context: context,
                            text: errorMessage,
                            color: PlatformTheme.white,
                            textColor: PlatformTheme.fourthColor,
                            icon: "assets/Animations/ErrorInfo.json",
                          );
                          print(e);
                        }
                      }
                      setState(() {
                        loading = false;
                      });
                    },
                    loading: loading,
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
