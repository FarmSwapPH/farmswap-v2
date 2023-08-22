import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FarmSwapBackArrowButton extends StatelessWidget {
  const FarmSwapBackArrowButton({
    super.key,
  });

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
            color: const Color.fromARGB(133, 255, 144, 18),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Align(
            child: SvgPicture.asset(
              "assets/svg/auth/back-arrow.svg",
            ),
          ),
        ),
      ),
    );
  }
}
