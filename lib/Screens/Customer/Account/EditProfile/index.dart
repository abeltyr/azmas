import 'package:azmas/Model/User/index.dart';
import 'package:azmas/Screens/Error/index.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Account/topBar.dart';
import 'package:azmas/Widgets/Shared/Button/detailButton.dart';
import 'package:azmas/Widgets/Shared/popup/camera.dart';
import 'package:azmas/Widgets/image/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SettingScreen extends StatelessWidget {
  static const routeName = "/settings";

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable:
          Hive.box<UserModel>('users').listenable(keys: ["currentUser"]),
      builder: (context, box, widget) {
        var boxData = box as Box<UserModel>;
        UserModel? user = boxData.get("currentUser");
        if (user != null)
          return Scaffold(
            backgroundColor: PlatformTheme.primaryColor,
            body: Column(
              children: [
                AuthTopBar(
                  title: "Account Settings",
                ),
                GestureDetector(
                  onTap: () {
                    showCupertinoModalBottomSheet(
                      context: context,
                      builder: (context) => CameraPopup(),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: PlatformTheme.secondaryColor
                                  .withOpacity(0.15),
                              spreadRadius: 2.5,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: LoadedImageView(imageUrl: user.avatar),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                              color: PlatformTheme.textColor2,
                              borderRadius: BorderRadius.circular(7.5)),
                          height: 35,
                          width: 35,
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: SvgPicture.asset(
                              "assets/Icons/Broken/Camera.svg",
                              fit: BoxFit.contain,
                              color: PlatformTheme.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                AzmasDetailButton(
                  onClick: () {},
                  title: "Personal Information",
                ),
                AzmasDetailButton(
                  onClick: () {},
                  title: "Social Media Details",
                ),
                AzmasDetailButton(
                  onClick: () {},
                  title: "Personal Information",
                ),
                AzmasDetailButton(
                  onClick: () {},
                  title: "Personal Information",
                ),
              ],
            ),
          );
        else
          return ErrorScreen();
      },
    );
  }
}
