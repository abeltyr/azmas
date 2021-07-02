import 'dart:convert';

import 'package:azmas/Providers/user/index.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UserProvider>(context, listen: false);
    Map data = {
      "account": usersProvider.currentUser.account,
      "avatar": usersProvider.currentUser.avatar,
      "amount": 0,
    };
    return Column(
      children: [
        QrImage(
          data: jsonEncode(data),
          eyeStyle: QrEyeStyle(
            eyeShape: QrEyeShape.square,
          ),
          embeddedImage: AssetImage(usersProvider.currentUser.avatar),
          embeddedImageStyle: QrEmbeddedImageStyle(
            size: Size(60, 60),
          ),
          // version: QrVersions.auto,
          size: 200.0,
          foregroundColor: PlatformTheme.thirdColor,
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }
}
