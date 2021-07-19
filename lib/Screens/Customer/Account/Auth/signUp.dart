import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Account/topBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = "/signUp";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool check = false;
  bool btnLoading = false;
  String countryCode = "ET";
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _fullNameController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _fullNameController = new TextEditingController(text: "");
    _passwordController = new TextEditingController(text: "");
    _passwordController = new TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    final double totalWidth = MediaQuery.of(context).size.width;
    final double totalHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: PlatformTheme.primaryColor,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          AuthTopBar(),

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
          // Expanded(child: child)
        ],
      ),
    );
  }
}
