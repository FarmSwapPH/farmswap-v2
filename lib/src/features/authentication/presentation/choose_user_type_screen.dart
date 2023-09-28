import 'package:farmswap_v2/src/features/authentication/presentation/bio_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common_widgets/farm_swap_buttons/farmswap_back_arrow_button.dart';
import '../../../common_widgets/farm_swap_buttons/farmswap_primary_button.dart';
import '../../../constants/typography.dart';

class ChooseUserTypeScreen extends StatelessWidget {
  const ChooseUserTypeScreen({super.key});

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
                          value: "What best describes\nyou?", height: height),
                      SizedBox(height: height * 0.024),
                      baseText(
                        value:
                            "Pick your role so you can start using the\nFarmSwap app.",
                      ),
                      SizedBox(height: height * 0.048),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              UserTypeCard(
                                user: Image.asset(
                                  "assets/images/png/farmer.png",
                                ),
                              ),
                              SizedBox(height: height * 0.024),
                              Text(
                                'Farmer',
                                style: TextStyle(
                                  color: const Color(0xFF14BE77),
                                  fontSize: height * 0.024,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.50,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 37,
                            child: Text(
                              'or',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xFF3B3B3B),
                                fontSize: height * 0.024,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                height: 1.31,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              UserTypeCard(
                                user: Align(
                                  child: SvgPicture.asset(
                                    "assets/images/png/consumer.svg",
                                  ),
                                ),
                              ),
                              SizedBox(height: height * 0.024),
                              Text(
                                'Consumer',
                                style: TextStyle(
                                  color: const Color(0xFF3B3B3B),
                                  fontSize: height * 0.024,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.50,
                                ),
                              )
                            ],
                          ),
                        ],
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

class UserTypeCard extends StatelessWidget {
  const UserTypeCard({
    super.key,
    required this.user,
  });

  final Widget user;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      width: 128,
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment(0.00, -1.00),
          end: Alignment(0, 1),
          colors: [Color(0xFF27CB7D), Color(0xFF4EE48A)],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: user,
    );
  }
}
