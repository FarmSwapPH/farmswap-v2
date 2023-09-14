import 'package:flutter/material.dart';

import '../../constants/typography.dart';

class PrimaryGreenButton extends StatelessWidget {
  const PrimaryGreenButton(
      {super.key,
      required this.value,
      required this.height,
      required this.width});

  final String value;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 326 / 375 * width,
        height: 57 / 812 * height,
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(0.99, -0.15),
            end: Alignment(-0.99, 0.15),
            colors: [Color(0xFF53E78B), Color(0xFF14BE77)],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Align(
          child: poppinsText(
            value: "Swap Now",
            size: 14,
            color: Colors.white,
            isBold: true,
          ),
        ),
      ),
    );
  }
}
