import 'dart:convert';
import 'package:azmas/Model/User/index.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/image/index.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRWidget extends StatelessWidget {
  final userProfile = Hive.box<UserModel>('users');
  @override
  Widget build(BuildContext context) {
    var user = userProfile.get("currentUser");
    Map data = {
      "avatar": user!.avatar,
      "amount": 0,
    };
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.topCenter,
          child: QrImage(
            data: jsonEncode(data),
            eyeStyle: QrEyeStyle(
              eyeShape: QrEyeShape.square,
            ),
            // version: QrVersions.auto,
            size: 250.0,
            foregroundColor: PlatformTheme.thirdColor,
            padding: EdgeInsets.zero,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Container(
            alignment: Alignment.center,
            width: 50,
            height: 50,
            margin: EdgeInsets.only(top: 90),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                15,
              ),
              child: LoadedImageView(
                imageUrl: user.avatar,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
