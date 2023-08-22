import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../common_widgets/farm_swap_buttons/farmswap_back_arrow_button.dart';
import '../../../common_widgets/farm_swap_buttons/farmswap_primary_button.dart';
import '../../../constants/typography.dart';
import 'splash_screen.dart';
import 'upload_photo_screen.dart';

class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: Stack(
            children: [
              Positioned.fill(
                top: 0,
                right: 0,
                child: SvgPicture.asset(
                  "assets/svg/bio/bio-pattern.svg",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                child: Container(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FarmSwapBackArrowButton(),
                      SizedBox(height: height * 0.024),
                      screenTitle(value: "Enter 4-digit\nVerification code"),
                      SizedBox(height: height * 0.024),
                      baseText(
                        value:
                            "Code send to +6282045****. This code\nwill expired in 01:30",
                      ),
                      SizedBox(height: height * 0.024),
                      PinCodeTextField(
                        appContext: context,
                        length: 4,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.circle,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 80,
                          activeFillColor: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      const Center(
                        child: FarmSwapPrimaryButton(
                          buttonTitle: "Next",
                          nextScreen: SplashScreen(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
