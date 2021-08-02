import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/image/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommunityPostIndictor extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  const CommunityPostIndictor({
    required this.imageUrl,
    required this.title,
    this.description = "Event By",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(
                5,
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
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "$title",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.lora(
                    color: PlatformTheme.secondaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    wordSpacing: 1,
                  ),
                ),
              ),
              Container(
                child: Text(
                  "$description",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.lora(
                    color: PlatformTheme.secondaryColor,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    fontSize: 11,
                    wordSpacing: 1,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
