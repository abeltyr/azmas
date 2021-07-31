import 'dart:io';

import 'package:azmas/Model/User/index.dart';
import 'package:azmas/Providers/upload/index.dart';
import 'package:azmas/Providers/user/profile.dart';
import 'package:azmas/Utils/inAppNotification.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Shared/Card/squareCard.dart';
import 'package:azmas/Widgets/Shared/popup/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:slugify/slugify.dart';

class CameraPopup extends StatelessWidget {
  final userProfile = Hive.box<UserModel>('users');
  final ImagePicker _picker = ImagePicker();

  Future<void> setAvatar({
    required Map file,
    required String ext,
    required XFile photo,
    required UserProfileProvider userProfileProvider,
  }) async {
    await userProfileProvider.profileUpdate(uploadFileId: file["id"]);
    final directory = await getApplicationDocumentsDirectory();
    final fileDirectory = directory.path;

    var user = userProfile.get("currentUser");
    String deleteFilePath =
        "$fileDirectory/${slugify('Image-${user!.avatar}').toString() + "$ext"}";
    user.avatar = file["url"];
    await userProfile.put(
      "currentUser",
      user,
    );
    File? deletedFile = new File(deleteFilePath);
    if (await deletedFile.exists()) await deletedFile.delete();
  }

  Future<void> uploadImage(XFile? photo, BuildContext context) async {
    if (photo != null) {
      final userProfileProvider =
          Provider.of<UserProfileProvider>(context, listen: false);
      var data = photo.path.split(".");
      try {
        userProfileProvider.setloading(true);
        Map? file = await Provider.of<UploadProvider>(context, listen: false)
            .uploadImage(file: photo);
        if (file != null && file["id"] != null && file["url"] != null) {
          await setAvatar(
            file: file,
            ext: data[data.length - 1],
            photo: photo,
            userProfileProvider: userProfileProvider,
          );
        } else
          errorRes(context);
      } catch (e) {
        errorRes(context);
        print(e);
      }
      userProfileProvider.setloading(false);
    }
  }

  void errorRes(BuildContext context) {
    String errorMessage = "SomeThing Went Wrong. Please Try Again";
    InAppNotification().showNotification(
      context: context,
      text: errorMessage,
      color: PlatformTheme.white,
      textColor: PlatformTheme.fourthColor,
      icon: "assets/Animations/ErrorInfo.json",
    );
  }

  @override
  Widget build(BuildContext context) {
    final double totalWidth = MediaQuery.of(context).size.width;
    String? platform;
    if (Platform.isAndroid)
      platform = "Android";
    else
      platform = "IPhone";

    return Container(
      height: 275,
      width: totalWidth,
      color: PlatformTheme.white,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(top: 10),
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: PlatformTheme.secondaryColor,
                  borderRadius: BorderRadius.circular(150),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                "Update Profile Image",
                style: GoogleFonts.lora(
                  color: PlatformTheme.textColor1,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  wordSpacing: 0.5,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              width: totalWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SquareCard(
                    onClick: () async {
                      try {
                        final XFile? photo =
                            await _picker.pickImage(source: ImageSource.camera);
                        await uploadImage(photo, context);
                      } catch (e) {
                        if (e.toString().contains("camera_access_denied")) {
                          final res = await Permission.camera.request();
                          if (PermissionStatus.permanentlyDenied == res) {
                            showCupertinoDialog(
                              context: context,
                              builder: (_) => MessagePopUp(
                                acceptFunction: () {
                                  openAppSettings();
                                },
                                title:
                                    "This Feature requires Access to your Camera",
                                subText:
                                    "In $platform settings, tap Azmas and allow access to camera",
                                cancel: "Not Now",
                                accept: "Settings",
                              ),
                            );
                          }
                        }
                      }
                    },
                    title: "Take Photo",
                    icon: "assets/Icons/Bold/Camera.svg",
                  ),
                  SquareCard(
                    onClick: () async {
                      try {
                        final XFile? image = await _picker.pickImage(
                            source: ImageSource.gallery);
                        await uploadImage(image, context);
                      } catch (e) {
                        if (e.toString().contains("photo_access_denied")) {
                          final res = await Permission.photos.request();
                          if (PermissionStatus.permanentlyDenied == res) {
                            showCupertinoDialog(
                              context: context,
                              builder: (_) => MessagePopUp(
                                acceptFunction: () {
                                  openAppSettings();
                                },
                                cancelFunction: () {
                                  print("here");
                                },
                                title:
                                    "This Feature requires Access to your Photos",
                                subText:
                                    "In $platform settings, tap Azmas and allow access to photos ",
                                cancel: "Not Now",
                                accept: "Settings",
                              ),
                            );
                          }
                        }
                      }
                    },
                    title: "Photo Library",
                    icon: "assets/Icons/Bold/Image.svg",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
