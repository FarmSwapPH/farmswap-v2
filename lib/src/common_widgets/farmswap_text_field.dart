import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FarmSwapTextField extends StatelessWidget {
  final String hintText;
  const FarmSwapTextField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      selectionHeightStyle: BoxHeightStyle.includeLineSpacingBottom,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          textStyle: const TextStyle(
            color: Color(0xFF3B3B3B),
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.50,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 0.50, color: Color(0xFFF4F4F4)),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              width: 0.50, color: Color.fromARGB(255, 50, 202, 108)),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 0.50, color: Colors.red),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 0.50, color: Colors.red),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
