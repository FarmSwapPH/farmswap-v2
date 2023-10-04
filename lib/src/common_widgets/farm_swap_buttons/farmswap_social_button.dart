import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FarmSwapSocialButton extends StatelessWidget {
  final String logoPath;
  final String buttonTitle;
  final VoidCallback onPress;
  const FarmSwapSocialButton({
    super.key,
    required this.logoPath,
    required this.buttonTitle,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        width: 152,
        height: 57,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 2),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x115A6CEA),
                    blurRadius: 50,
                    offset: Offset(12, 26),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Image.asset(
                logoPath,
                width: 25,
                height: 25,
              ),
            ),
            const SizedBox(width: 13),
            Text(
              buttonTitle,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Color(0xFF09051C),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
