import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

Text farmSwapFont(
    {required String text,
    required double size,
    String? fontFamily,
    Color? color}) {
  return Text(
    text,
    style: TextStyle(
      color: color ?? Colors.black,
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

Text screenTitle({required String value, required double height}) {
  return Text(
    value,
    style: GoogleFonts.poppins(
      textStyle: TextStyle(
        color: const Color(0xFF09051C),
        fontSize: 24 / 812 * height,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.50,
      ),
    ),
  );
}

Text baseText({required String value, Color color = Colors.black}) {
  return Text(
    value,
    style: GoogleFonts.poppins(
      textStyle: TextStyle(
        color: color,
        fontSize: 12,
        letterSpacing: 0.50,
      ),
    ),
  );
}

Text poppinsText(
    {required String value,
    required double size,
    Color? color,
    bool isBold = false}) {
  return Text(
    value,
    style: GoogleFonts.poppins(
      textStyle: TextStyle(
        color: color ?? const Color(0xFF09051C),
        fontSize: size,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        letterSpacing: 0.50,
        height: 1.20,
      ),
    ),
  );
}

class FarmSwapSectionTitle extends StatelessWidget {
  const FarmSwapSectionTitle({
    super.key,
    required this.height,
    required this.title,
    this.onPress,
  });

  final double height;
  final String title;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        poppinsText(
          value: title,
          size: 15 / 812 * height,
          isBold: true,
        ),
        const Spacer(),
        GestureDetector(
          onTap: onPress,
          child: poppinsText(
            value: 'See All',
            size: 15 / 812 * height,
            color: const Color(0xFF14BE77),
          ),
        ),
      ],
    );
  }
}
