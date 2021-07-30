import 'package:azmas/Widgets/Shared/animation.dart';
import 'package:azmas/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InAppNotification {
  showNotification({
    required BuildContext context,
    required String text,
    Color color = PlatformTheme.positive,
    Color textColor = PlatformTheme.white,
    String? icon,
    Duration duration = const Duration(milliseconds: 7500),
    bool loading = false,
    bool repeat = true,
  }) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        elevation: 0,
        key: UniqueKey(),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        duration: duration,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              15,
            ),
          ),
        ),
        margin: EdgeInsets.all(15),
        content: LayoutBuilder(builder: (context, snapshot) {
          return Container(
            child: Row(
              children: [
                if (loading)
                  Container(
                    width: 30,
                    height: 30,
                    child: AnimationWidget(
                      assetData: 'assets/Animations/Loader-1.json',
                      durationData: Duration(milliseconds: 2500),
                    ),
                  ),
                if (!loading && icon != null)
                  Container(
                    width: 30,
                    height: 30,
                    child: AnimationWidget(
                      assetData: icon,
                      repeat: repeat,
                      durationData: Duration(seconds: 1),
                    ),
                  ),
                if (loading || icon != null)
                  SizedBox(
                    width: 5,
                  ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: snapshot.maxWidth -
                      10 -
                      (loading || icon != null ? 45 : 0),
                  height: 20,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      "$text",
                      style: GoogleFonts.lora(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        wordSpacing: 1,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
