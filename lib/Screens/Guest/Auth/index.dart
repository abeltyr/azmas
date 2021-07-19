import 'package:azmas/Providers/user/index.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Shared/Button/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AuthIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final totalWidth = MediaQuery.of(context).size.width;
    final totalHeight = MediaQuery.of(context).size.height;
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
        child: Scaffold(
          backgroundColor: PlatformTheme.primaryColor,
          body: Container(
            width: totalWidth,
            height: totalHeight,
            // padding: EdgeInsets.symmetric(ho),
            child: Stack(
              children: [
                Container(
                  width: totalWidth,
                  height: totalHeight,
                  child: SvgPicture.asset(
                    "assets/Images/Background.svg",
                    fit: BoxFit.fill,
                  ),
                ),
                SafeArea(
                  child: Container(
                    width: totalWidth,
                    height: 50,
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          alignment: Alignment.center,
                          child: Text(
                            "Azmas",
                            style: GoogleFonts.lora(
                              color: PlatformTheme.textColor1,
                              fontWeight: FontWeight.w800,
                              fontSize: 32,
                              wordSpacing: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // GestureDetector(
                  //   onTap: () {
                  //     Provider.of<UserProvider>(context, listen: false)
                  //         .login();
                  //   },
                  //   child: Text(
                  //     "Auth",
                  //     textAlign: TextAlign.center,
                  //     style: GoogleFonts.lora(
                  //       color: PlatformTheme.secondaryColor,
                  //       fontWeight: FontWeight.w800,
                  //       fontSize: 22,
                  //       wordSpacing: 1,
                  //     ),
                  //   ),
                  // ),
                ),
                Positioned(
                  bottom: 90,
                  child: Container(
                    alignment: Alignment.topLeft,
                    height: 200,
                    width: totalWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: totalWidth,
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "Find events you like. \nJoin communities and discuses on \nthings that matter to you. \nFind like minded people.",
                            style: GoogleFonts.lora(
                              color: PlatformTheme.textColor1,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              wordSpacing: 1,
                              height: 1.4,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Container(
                          width: totalWidth,
                          height: 50,
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: AzmasButton(
                                  onClick: () {},
                                  color: PlatformTheme.textColor1,
                                  title: "Login",
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: AzmasButton(
                                  onClick: () {},
                                  color: PlatformTheme.positive,
                                  title: "Sign Up",
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
