import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';

typedef OnTextChangedCallback = void Function(String value);

// ignore: must_be_immutable
class FarmSwapTextField extends StatefulWidget {
  final String hintText;
  String? inputIcon;
  bool isPassword;
  bool isNumber;
  final TextEditingController controller;
  final validator;

  FarmSwapTextField({
    super.key,
    required this.hintText,
    this.inputIcon,
    this.isPassword = false,
    this.isNumber = false,
    required this.controller,
    required this.validator,
  });

  @override
  State<FarmSwapTextField> createState() => _FarmSwapTextFieldState();
}

class _FarmSwapTextFieldState extends State<FarmSwapTextField> {
  bool? viewPassword = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: FarmSwapGreen.lightGreenHover,
        ),
      ),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        cursorColor: FarmSwapGreen.normalGreen,
        obscureText: viewPassword! ? false : widget.isPassword,
        keyboardType:
            widget.isNumber == true ? TextInputType.number : TextInputType.text,
        // onChanged: (value) => {widget.onPress(value)},

        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          filled: true,
          fillColor: Colors.white,
          hintText: widget.hintText,
          hintStyle: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: Color(0xFF3B3B3B),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.50,
            ),
          ),
          prefixIcon: widget.inputIcon != null
              ? Container(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    widget.inputIcon!,
                    height: 20,
                    width: 20,
                  ),
                )
              : null,
          suffixIcon: widget.isPassword == true
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      viewPassword = !viewPassword!;
                    });
                  },
                  icon: Icon(
                    !viewPassword! ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                )
              : null,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 0.50, color: Color(0xFFF4F4F4)),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(width: 0.50, color: FarmSwapGreen.normalGreen),
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
