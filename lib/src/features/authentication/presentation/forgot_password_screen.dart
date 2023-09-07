import 'package:farmswap_v2/src/common_widgets/farm_swap_buttons/farmswap_back_arrow_button.dart';
import 'package:farmswap_v2/src/features/authentication/presentation/password_reset_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common_widgets/card/farmswap_contract_card.dart';
import '../../../common_widgets/dot/farmswap_dot.dart';
import '../../../common_widgets/farm_swap_buttons/farmswap_primary_button.dart';
import '../../../constants/typography.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
                      screenTitle(value: "Forgot password?"),
                      SizedBox(height: height * 0.024),
                      baseText(
                        value:
                            "Select which contact details should\nwe use to reset your password",
                      ),
                      SizedBox(height: height * 0.024),
                      FarmSwapContactCard(
                        width: width,
                        height: height,
                        iconPath: "assets/svg/forgot password/Message.svg",
                        title: "Via sms:",
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SimpleDot(),
                            const SizedBox(width: 4),
                            const SimpleDot(),
                            const SizedBox(width: 4),
                            const SimpleDot(),
                            const SizedBox(width: 4),
                            const SimpleDot(),
                            const SizedBox(width: 14),
                            const SimpleDot(),
                            const SizedBox(width: 4),
                            const SimpleDot(),
                            const SizedBox(width: 4),
                            const SimpleDot(),
                            const SizedBox(width: 4),
                            const SimpleDot(),
                            const SizedBox(width: 14),
                            Text(
                              '4235',
                              style: TextStyle(
                                color: const Color(0xFF09051C),
                                fontSize: height * 0.0197,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w400,
                                height: 1.50,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.024),
                      FarmSwapContactCard(
                        width: width,
                        height: height,
                        iconPath: "assets/svg/forgot password/Email.svg",
                        title: "Via sms:",
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SimpleDot(),
                            const SizedBox(width: 4),
                            const SimpleDot(),
                            const SizedBox(width: 4),
                            const SimpleDot(),
                            const SizedBox(width: 4),
                            const SimpleDot(),
                            const SizedBox(width: 14),
                            Text(
                              '@gmail.com',
                              style: TextStyle(
                                color: const Color(0xFF09051C),
                                fontSize: height * 0.0197,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w400,
                                height: 1.50,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      const Center(
                        child: FarmSwapPrimaryButton(
                          buttonTitle: "Next",
                          nextScreen: PasswordResetScreen(),
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
