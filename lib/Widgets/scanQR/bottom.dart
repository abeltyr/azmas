import 'package:azmas/Providers/interaction/qrScan.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QRScanBottomWidget extends StatefulWidget {
  @override
  _QRScanBottomWidgetState createState() => _QRScanBottomWidgetState();
}

class _QRScanBottomWidgetState extends State<QRScanBottomWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 650),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final qrScanProvider =
        Provider.of<QRScanPropsProvider>(context, listen: false);
    return GestureDetector(
      onTap: () {
        qrScanProvider.updateQRScan();
        if (!qrScanProvider.qrScan)
          _controller.forward();
        else
          _controller.reverse();
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            color: PlatformTheme.thirdColor,
            borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.symmetric(
          horizontal: 25,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition(
              turns: Tween(begin: 1.0, end: 0.0).animate(_controller),
              child: Container(
                height: 30,
                width: 30,
                child: SvgPicture.asset(
                  !qrScanProvider.qrScan
                      ? "assets/Icons/Broken/Scan.svg"
                      : "assets/Icons/Broken/Profile.svg",
                  color: PlatformTheme.white,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              !qrScanProvider.qrScan ? "Scan" : "My Account",
              style: GoogleFonts.lora(
                color: PlatformTheme.white,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
