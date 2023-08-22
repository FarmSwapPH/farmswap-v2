import "package:flutter/material.dart";

class SimpleDot extends StatelessWidget {
  const SimpleDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: const ShapeDecoration(
        color: Color(0xFF09051C),
        shape: OvalBorder(),
      ),
    );
  }
}
