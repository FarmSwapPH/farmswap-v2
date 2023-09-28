import 'package:farmswap_v2/src/features/authentication/presentation/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common_widgets/farm_swap_buttons/farmswap_primary_button.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset("assets/images/onboard_group.png"),
            const SizedBox(height: 20),
            SizedBox(
              width: 348,
              child: Text(
                'Empowering Small-Scale\nFarmers, One Swap at a Time',
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
              width: 274,
              child: Text(
                'Unlock New Opportunities to Swap, Sell and\nDeliver Fresh Produce Directly to Customers!',
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
