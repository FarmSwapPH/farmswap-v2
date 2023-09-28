import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import "package:google_fonts/google_fonts.dart";
import '../../../common_widgets/farm_swap_buttons/farmswap_primary_button.dart';
import "./onboarding_screen2.dart";

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SvgPicture.asset(
              "assets/svg/onboarding/onboarding1.svg",
            ),
            SizedBox(
              width: 211,
              child: Text(
                'Connect Directly with Consumers',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Color(0xFF09041B),
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 244,
              child: Text(
                'Trade Fresh Harvest for Pre-loved Items in an Instant',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 42),
            FarmSwapPrimaryButton(
              buttonTitle: "Next",
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}
