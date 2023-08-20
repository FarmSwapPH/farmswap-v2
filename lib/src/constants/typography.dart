import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

Text farmSwapFont(
    {required String text, required double size, String? fontFamily}) {
  return Text(
    text,
    style: TextStyle(
      color: Colors.black,
      fontSize: size,
      fontFamily: fontFamily ?? 'Viga',
      fontWeight: FontWeight.w800,
      height: 1.20,
    ),
  );
}

Text farmSwapFontHeading1({required String text}) {
  return Text(
    text,
    style: const TextStyle(
      color: Colors.black,
      fontSize: 65,
      fontFamily: 'Viga',
      fontWeight: FontWeight.w800,
      height: 1.20,
    ),
  );
}

Text farmSwapFontHeading2({required String text}) {
  return Text(
    text,
    style: const TextStyle(
      color: Colors.black,
      fontSize: 52,
      fontFamily: 'Viga',
      fontWeight: FontWeight.w800,
      height: 1.20,
    ),
  );
}

Text screenTitle({required String value}) {
  return Text(
    value,
    style: GoogleFonts.poppins(
      textStyle: const TextStyle(
        color: Color(0xFF09051C),
        fontSize: 25,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.50,
      ),
    ),
  );
}

Text baseText({required String value}) {
  return Text(
    value,
    style: GoogleFonts.poppins(
      textStyle: const TextStyle(
        color: Color(0xFF09051C),
        fontSize: 12,
        letterSpacing: 0.50,
      ),
    ),
  );
}

Text poppinsText({required String value, required double size, Color? color}) {
  return Text(
    value,
    style: GoogleFonts.poppins(
      textStyle: TextStyle(
        color: color ?? const Color(0xFF09051C),
        fontSize: size,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.50,
      ),
    ),
  );
}
