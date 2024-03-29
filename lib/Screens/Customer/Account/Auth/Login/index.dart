import 'package:azmas/Providers/user/index.dart';
import 'package:azmas/Screens/Customer/Account/Auth/Signup/index.dart';
import 'package:azmas/Utils/inAppNotification.dart';
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
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _userNameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _userNameController = new TextEditingController(text: "");
    _passwordController = new TextEditingController(text: "");
  }

  @override
  void dispose() {
    super.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
  }

  void keyboardDown() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
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
                            controller: _userNameController,
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
                              label: "Email or Username",
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
                              onClick: () async {
                                keyboardDown();
                                setState(() {
                                  check = true;
                                });
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    btnLoading = true;
                                  });
                                  try {
                                    await Provider.of<UserProvider>(context,
                                            listen: false)
                                        .login(
                                      password: _passwordController.text,
                                      userName: _userNameController.text,
                                    );
                                    return Navigator.pop(context);
                                  } catch (e) {
                                    String errorMessage =
                                        "SomeThing Went Wrong. Please Try Again";
                                    if (e.toString() ==
                                        "The Provided UserName Input Seems Invalid")
                                      errorMessage =
                                          "The Provided UserName Input Seems Invalid";
                                    else if (e.toString() ==
                                        "The Given Creditors Seems Wrong")
                                      errorMessage =
                                          "The Given Creditors Seems Wrong";
                                    else if (e.toString() ==
                                        "The Given Password Seems Wrong")
                                      errorMessage =
                                          "The Given Password Seems Wrong";
                                    InAppNotification().showNotification(
                                        context: context,
                                        text: errorMessage,
                                        color: PlatformTheme.white,
                                        textColor: PlatformTheme.fourthColor,
                                        icon:
                                            "assets/Animations/ErrorInfo.json");
                                    print(e);
                                  }
                                }
                                setState(() {
                                  btnLoading = false;
                                });
                              },
                              title: "Login",
                              color: PlatformTheme.textColor1,
                              loading: btnLoading,
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
