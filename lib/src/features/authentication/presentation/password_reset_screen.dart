import 'package:farmswap_v2/src/common_widgets/farm_swap_buttons/farmswap_back_arrow_button.dart';
import 'package:farmswap_v2/src/common_widgets/input/farmswap_text_field.dart';
import 'package:farmswap_v2/src/features/authentication/presentation/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common_widgets/farm_swap_buttons/farmswap_primary_button.dart';
import '../../../constants/typography.dart';

class PasswordResetScreen extends StatelessWidget {
  PasswordResetScreen({super.key});

  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

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
                      screenTitle(
                          value: "Reset your\npassword here", height: height),
                      SizedBox(height: height * 0.024),
                      baseText(
                        value:
                            "Select which contact details should\nwe use to reset your password",
                      ),
                      SizedBox(height: height * 0.048),
                      FarmSwapTextField(
                        hintText: "New Password",
                        controller: passwordController,
                        isPassword: true,
                      ),
                      SizedBox(height: height * 0.024),
                      FarmSwapTextField(
                        hintText: "Confirm New Password",
                        controller: newPasswordController,
                        isPassword: true,
                      ),
                      const Spacer(),
                      Center(
                        child: FarmSwapPrimaryButton(
                          buttonTitle: "Next",
                          onPress: () {},
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
