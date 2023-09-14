import 'package:flutter/material.dart';

class FarmSwapGenericButton extends StatelessWidget {
  const FarmSwapGenericButton({
    super.key,
    required this.icon,
    required this.bgColor,
  });

  final Icon icon;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 42,
          width: 42,
          decoration: BoxDecoration(
            color: bgColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Align(
            child: icon,
          ),
        ),
      ),
    );
  }
}
