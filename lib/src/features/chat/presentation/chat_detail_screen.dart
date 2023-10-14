import 'package:farmswap_v2/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common_widgets/farm_swap_buttons/farmswap_back_arrow_button.dart';
import '../../../constants/typography.dart';

class ChatDetailScreen extends StatelessWidget {
  const ChatDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
                        value: "Chat",
                      ),
                      SizedBox(height: height * 0.024),
                      Container(
                        height: height * 0.089,
                        width: width,
                        padding: const EdgeInsets.all(10),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
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
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                // color: FarmSwapGreen.normalGreen,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              width: 62,
                              height: 62,
                              child: Align(
                                child: Image.asset("assets/images/person.png"),
                              ),
                            ),
                            const SizedBox(
                              width: 17,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                poppinsText(
                                  value: "Rai Dark",
                                  size: 15 / 812 * height,
                                  isBold: true,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Stack(
                                  children: [
                                    Positioned(
                                      child: Container(
                                        height: 6,
                                        width: 6,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: FarmSwapGreen.normalGreen,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      child: poppinsText(
                                        value: "Hala ang itoy",
                                        size: 14 / 812 * height,
                                        color: const Color(0xFF3B3B3B),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            poppinsText(
                              value: "10 mins",
                              size: 14 / 812 * height,
                              color: const Color(0xFF3B3B3B),
                            ),
                          ],
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
