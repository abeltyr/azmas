import 'package:azmas/Model/User/index.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Shared/Card/squareCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:slugify/slugify.dart';

class CameraPopup extends StatelessWidget {
  final userProfile = Hive.box<UserModel>('users');
  final ImagePicker _picker = ImagePicker();

  Future<void> setAvatar(XFile? photo) async {
    if (photo != null) {
      final directory = await getApplicationDocumentsDirectory();
      final fileDirectory = directory.path;
      var imageUrl = "Local-UserProfile";
      String filePath =
          "$fileDirectory/${slugify('Image-$imageUrl').toString() + ".png"}";
      await photo.saveTo(filePath);
      var user = userProfile.get("currentUser");
      user!.avatar = imageUrl;
      userProfile.put(
        "currentUser",
        user,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double totalWidth = MediaQuery.of(context).size.width;

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
                      final XFile? photo =
                          await _picker.pickImage(source: ImageSource.camera);
                      await setAvatar(photo);
                    },
                    title: "Take Photo",
                    icon: "assets/Icons/Bold/Camera.svg",
                  ),
                  SquareCard(
                    onClick: () async {
                      final XFile? image =
                          await _picker.pickImage(source: ImageSource.gallery);
                      await setAvatar(image);
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
