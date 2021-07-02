import 'package:azmas/Providers/interaction/qrScan.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/scanQR/bottom.dart';
import 'package:azmas/Widgets/scanQR/qr.dart';
import 'package:azmas/Widgets/scanQR/scan.dart';
import 'package:azmas/Widgets/scanQR/top.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QRScanScreen extends StatelessWidget {
  static const routeName = "/QRScan";

  @override
  Widget build(BuildContext context) {
    final qrScanProvider =
        Provider.of<QRScanPropsProvider>(context, listen: true);
    return Scaffold(
      body: Stack(
        children: [
          if (qrScanProvider.qrScan)
            QRScanWidget()
          else
            Container(
              child: Column(
                children: [
                  TopWidget(
                    iconColor: PlatformTheme.primaryColor,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - 107,
                    width: MediaQuery.of(context).size.width,
                    child: QRWidget(),
                  ),
                ],
              ),
            ),
          Positioned(
            bottom: 30,
            left: 2,
            right: 2,
            child: QRScanBottomWidget(),
          ),
        ],
      ),
    );
  }
}
