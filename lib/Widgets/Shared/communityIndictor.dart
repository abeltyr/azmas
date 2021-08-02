import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/image/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GroupIndictor extends StatelessWidget {
  final String imageUrl;
  final String title;
  const GroupIndictor({
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text(
              "Event By",
              style: GoogleFonts.lora(
                color: PlatformTheme.secondaryColor,
                fontWeight: FontWeight.w400,
                fontSize: 16,
                wordSpacing: 0.1,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(2.5),
            margin: EdgeInsets.only(right: 15),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      50,
                    ),
                  ),
                  child: Container(
                    color: PlatformTheme.primaryColorTransparent,
                    height: 30,
                    width: 30,
                    child: LoadedImageView(
                      fitData: BoxFit.fill,
                      imageUrl: imageUrl,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: 10.0 * title.length < 120 ? 10.0 * title.length : 120,
                  child: Text(
                    "$title",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.lora(
                      color: PlatformTheme.secondaryColor,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                      wordSpacing: 1,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
