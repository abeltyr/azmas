import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListData extends StatelessWidget {
  final String title;
  final String mainText;
  final Color textColor;
  const ListData({
    required this.title,
    required this.mainText,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title",
            style: GoogleFonts.lora(
              color: textColor,
              fontWeight: FontWeight.w500,
              fontSize: 14,
              wordSpacing: 1,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              "$mainText",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.lora(
                color: textColor,
                fontWeight: FontWeight.w800,
                fontSize: 18,
                wordSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
