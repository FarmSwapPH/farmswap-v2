import 'package:farmswap_v2/src/common_widgets/farm_swap_buttons/farmswap_back_arrow_button.dart';
import 'package:farmswap_v2/src/common_widgets/input/farmswap_text_field.dart';
import 'package:farmswap_v2/src/constants/typography.dart';
import 'package:farmswap_v2/src/features/authentication/presentation/payment_method_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../common_widgets/farm_swap_buttons/farmswap_primary_button.dart';

class BioScreen extends StatelessWidget {
  const BioScreen({super.key});

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
                          value: "Fill in your bio to get\nstarted",
                          height: height),
                      SizedBox(height: height * 0.024),
                      baseText(
                        value:
                            "This data will be displayed in your\naccount profile for security",
                      ),
                      SizedBox(height: height * 0.024),
                      Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(
                                  90, 108, 234, 0.05), // Color with opacity
                              blurRadius: 50.0, // Blur radius
                            ),
                          ],
                        ),
                        child: FarmSwapTextField(
                          hintText: 'First Name',
                          onPress: () {},
                        ),
                      ),
                      SizedBox(height: height * 0.024),
                      Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(
                                  90, 108, 234, 0.05), // Color with opacity
                              blurRadius: 50.0, // Blur radius
                            ),
                          ],
                        ),
                        child: FarmSwapTextField(
                          hintText: 'Last Name',
                          onPress: () {},
                        ),
                      ),
                      SizedBox(height: height * 0.024),
                      Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(
                                  90, 108, 234, 0.05), // Color with opacity
                              blurRadius: 50.0, // Blur radius
                            ),
                          ],
                        ),
                        child: FarmSwapTextField(
                          hintText: 'Mobile Number',
                          onPress: () {},
                          isNumber: true,
                        ),
                      ),
                      const Spacer(),
                      const Center(
                        child: FarmSwapPrimaryButton(
                          buttonTitle: "Next",
                          nextScreen: PaymentMethodScreen(),
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
