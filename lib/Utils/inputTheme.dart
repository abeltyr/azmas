import 'package:azmas/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputTheme {
  InputDecoration textDecoration({required String label}) {
    return InputDecoration(
      fillColor: PlatformTheme.positive,
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      hintText: '$label',
      contentPadding: EdgeInsets.fromLTRB(0.0, -15, 10.0, 0),
      labelStyle: GoogleFonts.lora(
        color: PlatformTheme.secondaryColor,
        fontWeight: FontWeight.w600,
        fontSize: 20,
        wordSpacing: 0.1,
      ),
    );
  }
}
