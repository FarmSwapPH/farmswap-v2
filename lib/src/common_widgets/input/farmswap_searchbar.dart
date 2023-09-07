import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';

// ignore: must_be_immutable
class FarmSwapSearchbar extends StatefulWidget {
  final VoidCallback onPress;
  String? inputIcon;

  FarmSwapSearchbar({
    super.key,
    required this.onPress,
    this.inputIcon,
  });

  @override
  State<FarmSwapSearchbar> createState() => _FarmSwapSearchbarState();
}

class _FarmSwapSearchbarState extends State<FarmSwapSearchbar> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: const Color(0xFFDA6317).withOpacity(0.4),
        ),
      ),
      child: TextField(
        cursorColor: const Color(0xFFDA6317),
        // obscureText: viewPassword! ? false : widget.isPassword,
        keyboardType: TextInputType.text,
        // onChanged: (value) => widget.onPress,
        // selectionHeightStyle: BoxHeightStyle.includeLineSpacingBottom,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          filled: true,
          fillColor: const Color(0xFFF9A84D).withOpacity(0.1),
          hintText: "What do you want to order?",
          hintStyle: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: const Color(0xFFDA6317).withOpacity(0.4),
              fontSize: 11,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.50,
            ),
          ),
          prefixIcon: widget.inputIcon != null
              ? Container(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    widget.inputIcon!,
                    width: 24,
                    height: 24,
                  ),
                )
              : null,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 0.50, color: Color(0xFFF4F4F4)),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 0.50,
              color: Color(0xFFDA6317),
            ),
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
      ),
    );
  }
}
