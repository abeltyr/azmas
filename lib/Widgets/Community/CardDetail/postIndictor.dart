import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Shared/save.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PostIndictor extends StatelessWidget {
  final String author;
  final DateTime date;
  final String readTime;
  const PostIndictor({
    required this.author,
    required this.date,
    required this.readTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                "${DateFormat.yMMMd().format(date)}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.lora(
                  color: PlatformTheme.darkPrimaryColor,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  fontSize: 11,
                  wordSpacing: 1,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: PlatformTheme.darkPrimaryColor,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "$readTime read",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.lora(
                  color: PlatformTheme.darkPrimaryColor,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  fontSize: 11,
                  wordSpacing: 1,
                ),
              ),
            ],
          ),
          SaveWidget(),
        ],
      ),
    );
  }
}
