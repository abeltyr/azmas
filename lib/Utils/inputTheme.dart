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

  InputDecoration textInputDecoration({required String label}) {
    return InputDecoration(
      fillColor: PlatformTheme.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7.5),
        borderSide: BorderSide(
          color: PlatformTheme.textColor2,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7.5),
        borderSide: BorderSide(
          color: PlatformTheme.textColor2,
        ),
      ),
      labelStyle: GoogleFonts.lora(
          color: PlatformTheme.textColor2,
          fontWeight: FontWeight.w600,
          fontSize: 18,
          wordSpacing: 1),
      // filled: true,
      focusColor: PlatformTheme.textColor2,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7.5),
        borderSide: BorderSide(
          color: PlatformTheme.textColor2,
        ),
      ),
      labelText: '$label',
      contentPadding: EdgeInsets.fromLTRB(10.0, -15, 10, 0),
    );
  }
}
