import 'package:azmas/Screens/Customer/Account/Auth/Signup/part1.dart';
import 'package:azmas/Screens/Customer/Account/Auth/Signup/part2.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Account/topBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = "/signUp";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool validationCheck1 = false;
  bool validationCheck2 = false;
  bool validationCheck3 = false;
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

  late TextEditingController _genderController;
  late TextEditingController _birthDateController;
  late TextEditingController _birthDateRealValueController;

  late TextEditingController _instaController;
  late TextEditingController _twitterController;
  late TextEditingController _telegramController;

  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _fullNameController = new TextEditingController(text: "");
    _emailController = new TextEditingController(text: "");
    _phoneNumberController = new TextEditingController(text: "+251");
    _genderController = new TextEditingController(text: "");
    _birthDateController = new TextEditingController();
    _birthDateRealValueController = new TextEditingController();
    _instaController = new TextEditingController(text: "");
    _twitterController = new TextEditingController(text: "");
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
      body: Column(
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
                    birthDateRealValueController: _birthDateRealValueController,
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
                        print(_fullNameController.text);
                        print(_emailController.text);
                        print(_phoneNumberController.text);
                        print(_birthDateController.text);
                        print(_birthDateRealValueController.text);
                        print(_genderController.text);
                      }
                    },
                    backAction: () {
                      setState(() {
                        steps = 0;
                      });
                    },
                  ),
                  Container(
                    child: Text("3"),
                  ),
                  Container(
                    child: Text("4"),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
