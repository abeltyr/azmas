import 'package:azmas/Utils/networkUrl.dart';
import 'package:azmas/Widgets/image/index.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrData extends StatelessWidget {
  final String ticketId;
  final String image;
  final Color textColor;
  const QrData({
    required this.ticketId,
    required this.image,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final double totalWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          width: totalWidth,
          padding: EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          child: QrImage(
            data: "${NetworkUrl.PublicUrl}$ticketId",
            eyeStyle: QrEyeStyle(
              eyeShape: QrEyeShape.square,
            ),
            size: 250,
            foregroundColor: textColor,
            padding: EdgeInsets.zero,
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 45,
          width: 45,
          margin: EdgeInsets.symmetric(
            horizontal: (totalWidth - 45) / 2,
            vertical: 102.5,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(7.5),
            child: LoadedImageView(imageUrl: image),
          ),
        ),
        // if (used) Banner()
      ],
    );
  }
}
