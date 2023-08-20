import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common_widgets/farmswap_primary_button.dart';
import '../../../constants/typography.dart';
import 'splash_screen.dart';

class SetLocationScreen extends StatelessWidget {
  const SetLocationScreen({super.key});

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
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
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
                      ),
                      SizedBox(height: height * 0.024),
                      screenTitle(value: "Set Your Location "),
                      SizedBox(height: height * 0.024),
                      baseText(
                        value:
                            "This data will be displayed in your\naccount profile for security",
                      ),
                      SizedBox(height: height * 0.024),
                      Center(
                        child: Container(
                          width: width * 0.912,
                          height: height * 0.181,
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
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 33,
                                    height: 33,
                                    decoration: const ShapeDecoration(
                                      color: Color(0xFFFFE14D),
                                      shape: OvalBorder(),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.location_on,
                                        color: Colors.orange,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 14),
                                  Text('Your Location',
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          color: Color(0xFF09041B),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          height: 1.31,
                                        ),
                                      ))
                                ],
                              ),
                              SizedBox(height: height * 0.012),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {},
                                  borderRadius: BorderRadius.circular(15),
                                  child: Container(
                                    width: width * 0.858,
                                    height: height * 0.0701970443349754,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFFF6F6F6),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      shadows: const [
                                        BoxShadow(
                                          color: Color(0x115A6CEA),
                                          blurRadius: 50,
                                          offset: Offset(0, 0),
                                          spreadRadius: 0,
                                        )
                                      ],
                                    ),
                                    child: Center(
                                      child: poppinsText(
                                          value: "Set Location", size: 14),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
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
