import 'package:azmas/Model/User/index.dart';
import 'package:azmas/Utils/inputTheme.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Shared/Button/index.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SocialSettings extends StatefulWidget {
  @override
  _SocialSettingsState createState() => _SocialSettingsState();
}

class _SocialSettingsState extends State<SocialSettings> {
  final userProfile = Hive.box<UserModel>('users');
  bool validationCheck = false;
  bool loading = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _instaController;
  late TextEditingController _twitterController;
  late TextEditingController _telegramController;

  @override
  void initState() {
    super.initState();
    var user = userProfile.get("currentUser");
    _instaController = new TextEditingController(text: user!.instagram);
    _twitterController = new TextEditingController(text: user.twitter);
    _telegramController = new TextEditingController(text: user.telegram);
  }

  @override
  void dispose() {
    super.dispose();
    _instaController.dispose();
    _twitterController.dispose();
    _telegramController.dispose();
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
                controller: _instaController,
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
                decoration: InputTheme()
                    .textInputDecoration(label: "Instagram Username"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This is a required field';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _twitterController,
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
                controller: _telegramController,
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
                decoration: InputTheme()
                    .textInputDecoration(label: "Telegram Username"),
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
                        //TODO: add the api here//TODO: add the api here
                        var user = userProfile.get("currentUser");

                        user!.instagram = _instaController.text;
                        user.twitter = _twitterController.text;
                        user.telegram = _telegramController.text;

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
