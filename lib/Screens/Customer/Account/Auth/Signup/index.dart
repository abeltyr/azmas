import 'package:azmas/Model/User/index.dart';
import 'package:azmas/Providers/user/index.dart';
import 'package:azmas/Screens/Customer/Account/Auth/Login/index.dart';
import 'package:azmas/Screens/Customer/Account/Auth/Signup/part1.dart';
import 'package:azmas/Screens/Customer/Account/Auth/Signup/part2.dart';
import 'package:azmas/Screens/Customer/Account/Auth/Signup/part3.dart';
import 'package:azmas/Screens/Customer/Account/Auth/Signup/part4.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Account/topBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = "/signUp";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool validationCheck1 = false;
  bool validationCheck2 = false;
  bool validationCheck3 = false;
  bool validationCheck4 = false;
  bool loading = false;
  late String phone;
  int steps = 0;
  List<GlobalKey<FormState>> _formKey = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];
  late TextEditingController _fullNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _userNameController;

  late TextEditingController _genderController;
  late TextEditingController _birthDateController;
  late TextEditingController _birthDateRealValueController;

  late TextEditingController _instaController;
  late TextEditingController _twitterController;
  late TextEditingController _telegramController;
  late TextEditingController _facebookController;

  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _fullNameController = new TextEditingController(text: "");
    _emailController = new TextEditingController(text: "");
    _phoneNumberController = new TextEditingController(text: "+251");
    _userNameController = new TextEditingController(text: "");

    _genderController = new TextEditingController(text: "");
    _birthDateController = new TextEditingController();

    _birthDateRealValueController = new TextEditingController();
    _instaController = new TextEditingController(text: "");
    _twitterController = new TextEditingController(text: "");
    _facebookController = new TextEditingController(text: "");

    _telegramController = new TextEditingController(text: "");
    _passwordController = new TextEditingController(text: "");
    _confirmPasswordController = new TextEditingController(text: "");
  }

  @override
  void dispose() {
    super.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _genderController.dispose();
    _birthDateController.dispose();
    _birthDateRealValueController.dispose();
    _instaController.dispose();
    _twitterController.dispose();
    _telegramController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                  "Create Your Account",
                  style: GoogleFonts.lora(
                    color: PlatformTheme.textColor1,
                    fontWeight: FontWeight.w800,
                    fontSize: 24,
                    wordSpacing: 1,
                    height: 1.4,
                  ),
                ),
              ),
              Container(
                width: totalWidth,
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Text(
                  "Sign Up And Get Started",
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
              SizedBox(
                height: 15,
              ),
              Container(
                width: totalWidth,
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Text(
                  "Step: ${steps + 1}/4",
                  style: GoogleFonts.lora(
                    color: PlatformTheme.textColor1,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    wordSpacing: 1,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Stack(
                  children: [
                    Container(
                      width: totalWidth,
                      height: 10,
                      decoration: BoxDecoration(
                        color: PlatformTheme.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      width: (totalWidth - 50) * (steps + 1) / 4,
                      height: 10,
                      decoration: BoxDecoration(
                        color: PlatformTheme.positive.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: IndexedStack(
                    index: steps,
                    children: [
                      SignUpForm1(
                        userNameController: _userNameController,
                        fullNameController: _fullNameController,
                        phoneNumberController: _phoneNumberController,
                        emailController: _emailController,
                        check: validationCheck1,
                        formKey: _formKey[0],
                        action: () {
                          keyboardDown();
                          setState(() {
                            validationCheck1 = true;
                          });
                          if (_formKey[0].currentState!.validate()) {
                            setState(() {
                              steps = 1;
                            });
                          }
                        },
                      ),
                      SignUpForm2(
                        genderController: _genderController,
                        birthDateRealValueController:
                            _birthDateRealValueController,
                        birthDateController: _birthDateController,
                        check: validationCheck2,
                        formKey: _formKey[1],
                        action: () {
                          keyboardDown();
                          setState(() {
                            validationCheck2 = true;
                          });
                          if (_formKey[1].currentState!.validate()) {
                            setState(() {
                              steps = 2;
                            });
                          }
                        },
                        backAction: () {
                          setState(() {
                            steps = 0;
                          });
                        },
                      ),
                      SignUpForm3(
                        instaController: _instaController,
                        twitterController: _twitterController,
                        telegramController: _telegramController,
                        facebookController: _facebookController,
                        check: validationCheck3,
                        formKey: _formKey[2],
                        action: () {
                          keyboardDown();
                          setState(() {
                            validationCheck3 = true;
                          });
                          if (_formKey[2].currentState!.validate()) {
                            setState(() {
                              steps = 3;
                            });
                          }
                        },
                        backAction: () {
                          setState(() {
                            steps = 1;
                          });
                        },
                      ),
                      SignUpForm4(
                        passwordController: _passwordController,
                        confirmPasswordController: _confirmPasswordController,
                        check: validationCheck4,
                        loading: loading,
                        formKey: _formKey[3],
                        action: () async {
                          keyboardDown();
                          setState(() {
                            validationCheck4 = true;
                          });
                          if (_formKey[3].currentState!.validate()) {
                            setState(() {
                              loading = true;
                            });
                            try {
                              await Provider.of<UserProvider>(context,
                                      listen: false)
                                  .signUp(
                                data: UserModel(
                                  userName: _userNameController.text,
                                  avatar: "https://source.unsplash.com/random",
                                  fullName: _fullNameController.text,
                                  email: _emailController.text,
                                  phoneNumber: _phoneNumberController.text,
                                  birthDate: DateTime.parse(
                                      _birthDateRealValueController.text),
                                  createdAt: DateTime.now(),
                                  updatedAt: DateTime.now(),
                                  id: "1",
                                  gender: _genderController.text,
                                  instagram: _instaController.text,
                                  twitter: _twitterController.text,
                                  telegram: _telegramController.text,
                                  facebook: _facebookController.text,
                                  verified: true,
                                  activated: true,
                                ),
                                password: _passwordController.text,
                              );
                              Navigator.pop(context);
                            } catch (e) {
                              print(e);
                            }
                          }

                          setState(() {
                            loading = false;
                          });
                        },
                        backAction: () {
                          setState(() {
                            steps = 2;
                          });
                        },
                      ),
                    ],
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
                    "I Already Have An Account",
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
                      Navigator.popAndPushNamed(context, LoginScreen.routeName);
                    },
                    child: Text(
                      "Login",
                      style: GoogleFonts.lora(
                        color: PlatformTheme.positive,
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
