import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Community/CardDetail/communityIndictor.dart';
import 'package:azmas/Widgets/Community/CardDetail/detail.dart';
import 'package:azmas/Widgets/Shared/brokenLine.dart';
import 'package:azmas/Widgets/Shared/communityIndictor.dart';
import 'package:azmas/Widgets/image/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 20,
        itemBuilder: (ctx, index) {
          return Container(
            margin: EdgeInsets.symmetric(
              vertical: 5,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: PlatformTheme.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommunityPostIndictor(
                  imageUrl: "https://source.unsplash.com/1600x900/?nature",
                  title: "Azmas",
                  description: "Posted By Abel . 10h ago",
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 5,
                  ),
                  child: Text(
                    "Lorem Ipsum is simply dummy",
                    style: GoogleFonts.lora(
                      color: PlatformTheme.darkPrimaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      wordSpacing: 1,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 5,
                    bottom: 10,
                  ),
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularized in the 1960s with the release of Leeriest sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Lauds PageMaker including versions of Lorem Ipsum.",
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.lora(
                      color: PlatformTheme.darkPrimaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      wordSpacing: 1,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        7.5,
                      ),
                    ),
                    child: Container(
                      color: PlatformTheme.primaryColorTransparent,
                      height: 30,
                      width: 30,
                      child: LoadedImageView(
                        fitData: BoxFit.fill,
                        imageUrl:
                            "https://source.unsplash.com/1600x900/?nature",
                      ),
                    ),
                  ),
                ),
                BrokenLine(
                  color: PlatformTheme.primaryColor,
                  size: 5,
                ),
                CommunityDetail(),
              ],
            ),
          );
        });
  }
}
