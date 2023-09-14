import 'package:flutter/material.dart';

class FarmSwapWhiteIcon extends StatelessWidget {
  const FarmSwapWhiteIcon({
    super.key,
    required this.icon,
  });

  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(20, 78, 90, 0.2), // 144E5A with 20% opacity
            offset: Offset(11, 28),
            blurRadius: 50,
          ),
        ],
      ),
      child: Align(
        child: icon,
      ),
    );
  }
}
