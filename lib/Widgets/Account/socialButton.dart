import 'package:azmas/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialButton extends StatelessWidget {
  final String url;
  final String icon;

  const SocialButton({
    required this.icon,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (await canLaunch(url)) {
          bool res = await launch(
            url,
            forceSafariVC: false,
            universalLinksOnly: true,
          );
          if (!res)
            await launch(
              url,
              forceSafariVC: true,
              universalLinksOnly: true,
            );
        } else {
          throw 'There was a problem to open the url: $url';
        }
      },
      child: Container(
        height: 40,
        width: 40,
        padding: EdgeInsets.symmetric(
          vertical: 7,
          horizontal: 7,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.5),
          color: PlatformTheme.textColor2.withOpacity(0.75),
        ),
        child: SvgPicture.asset(
          "$icon",
          color: PlatformTheme.white,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
