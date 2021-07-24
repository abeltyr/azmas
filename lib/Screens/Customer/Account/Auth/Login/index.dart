import 'package:azmas/Model/User/index.dart';
import 'package:azmas/Providers/user/index.dart';
import 'package:azmas/Screens/Customer/Account/Auth/Signup/index.dart';
import 'package:azmas/Utils/inputTheme.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Account/topBar.dart';
import 'package:azmas/Widgets/Shared/Button/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool check = false;
  bool btnLoading = false;
  String countryCode = "ET";
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _phoneNumberController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _phoneNumberController = new TextEditingController(text: "");
    _passwordController = new TextEditingController(text: "");
  }

  @override
  void dispose() {
    super.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double totalWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: PlatformTheme.primaryColor,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            children: [
              AuthTopBar(),
              SizedBox(
                height: 7.5,
              ),
              Container(
                width: totalWidth,
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Text(
                  "Welcome Back,",
                  style: GoogleFonts.lora(
                    color: PlatformTheme.textColor1,
                    fontWeight: FontWeight.w800,
                    fontSize: 24,
                    wordSpacing: 1,
                    height: 1.4,
                  ),
                ),
              ),
              SizedBox(
                height: 7.5,
              ),
              Container(
                width: totalWidth,
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Text(
                  "Login To Continue",
                  style: GoogleFonts.lora(
                    color: PlatformTheme.textColor1,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    wordSpacing: 1,
                    height: 1.4,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: Form(
                      key: _formKey,
                      autovalidateMode: check
                          ? AutovalidateMode.always
                          : AutovalidateMode.disabled,
                      onChanged: () {},
                      child: ListView(
                        children: [
                          TextFormField(
                            controller: _phoneNumberController,
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
                            decoration: InputTheme().textInputDecoration(
                              label: "Phone Number, Username",
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'This is a required field';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: _passwordController,
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
                            decoration: InputTheme()
                                .textInputDecoration(label: "Password"),
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
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                print("forgot");
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 2.5,
                                  vertical: 5,
                                ),
                                child: Text(
                                  "Forget Password?",
                                  style: TextStyle(
                                    color: PlatformTheme.thirdColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            height: 50,
                            child: AzmasButton(
                              onClick: () {
                                Navigator.pop(context);
                                Provider.of<UserProvider>(context,
                                        listen: false)
                                    .setupUser(
                                  UserModel(
                                    userName: "Abeltyr",
                                    avatar:
                                        "https://source.unsplash.com/random",
                                    fullName: "Abel lamesgen",
                                    email: "abellamesgen@gmail.com",
                                    phoneNumber: "+251911223989",
                                    birthDate: DateTime.parse(
                                        "1998-07-24 00:00:00.000"),
                                    createdAt: DateTime.now(),
                                    updatedAt: DateTime.now(),
                                    id: "1",
                                    gender: "Male",
                                    instagram: "aveltyr",
                                    twitter: "aveltyr",
                                    telegram: "aveltyr",
                                    verified: true,
                                  ),
                                );
                              },
                              title: "Login",
                              color: PlatformTheme.textColor1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: totalWidth,
              padding: EdgeInsets.symmetric(
                horizontal: 30,
              ),
              margin: EdgeInsets.only(
                bottom: 50,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't Have An Account",
                    style: GoogleFonts.lora(
                      color: PlatformTheme.textColor1,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      wordSpacing: 1,
                      height: 1.4,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(
                    width: 7.5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.popAndPushNamed(
                          context, SignUpScreen.routeName);
                    },
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.lora(
                        color: PlatformTheme.fourthColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        wordSpacing: 1,
                        height: 1.4,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                        decorationThickness: 0.5,
                        decorationStyle: TextDecorationStyle.dotted,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
