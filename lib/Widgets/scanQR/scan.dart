import 'dart:io';

import 'package:azmas/Utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class QRScanWidget extends StatefulWidget {
  const QRScanWidget({Key? key}) : super(key: key);

  @override
  _QRScanWidgetState createState() => _QRScanWidgetState();
}

class _QRScanWidgetState extends State<QRScanWidget> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController controller;
  late Barcode result;
  bool flashLightOn = false;
  late RiveAnimationController _animationController;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _animationController = SimpleAnimation('Animation 1');
  }

  @override
  void dispose() {
    controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Container(
              height: 250,
              width: 250,
              margin: EdgeInsets.only(bottom: 50),
              decoration: BoxDecoration(
                  // border: Border(
                  //   left: BorderSide(
                  //     width: 1,
                  //     color: PlatformTheme.thirdColor,
                  //   ),
                  //   right: BorderSide(
                  //     width: 1,
                  //     color: PlatformTheme.thirdColor,
                  //   ),
                  // ),
                  ),
              child: Center(
                  child: RiveAnimation.asset(
                'assets/animation/scan.riv',
                // animations: [
                //   'Animation 1',
                // ],
                controllers: [_animationController],
              )),
              //  Lottie.asset('assets/animation/QRscan.json'),
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () async {
                    controller.toggleFlash();
                    setState(() {
                      flashLightOn = !flashLightOn;
                    });
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.bottomCenter,
                    child: Icon(
                      flashLightOn ? Icons.flash_off : Icons.flash_on_outlined,
                      color: PlatformTheme.thirdColor,
                      size: 30,
                    ),
                  ),
                ),
                Container(),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.bottomCenter,
                    color: Colors.transparent,
                    child: Icon(
                      CupertinoIcons.xmark_circle,
                      color: PlatformTheme.thirdColor,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
