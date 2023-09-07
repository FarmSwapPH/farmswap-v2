import 'package:farmswap_v2/src/common_widgets/farm_swap_buttons/farmswap_white_button.dart';
import 'package:farmswap_v2/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common_widgets/input/farmswap_searchbar.dart';
import '../../../constants/typography.dart';

class DasboardScreen extends StatelessWidget {
  const DasboardScreen({super.key});

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
                      SizedBox(height: height * 0.024),
                      Row(
                        children: [
                          screenTitle(
                              value: "Find Your\nFavorite Food",
                              height: height),
                          const Spacer(),
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(20, 78, 90,
                                      0.2), // 144E5A with 20% opacity
                                  offset: Offset(11, 28),
                                  blurRadius: 50,
                                ),
                              ],
                            ),
                            child: Align(
                              child: SvgPicture.asset(
                                "assets/svg/dashboard/Icon Notification.svg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.022),
                      SizedBox(
                        width: width,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 267 / 375 * width,
                              child: FarmSwapSearchbar(
                                onPress: () {},
                                inputIcon:
                                    "assets/svg/dashboard/Icon Search.svg",
                              ),
                            ),
                            const SizedBox(
                              width: 9,
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(15),
                                onTap: () {},
                                child: Container(
                                  width: 49,
                                  height: 50,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFF9A84D)
                                        .withOpacity(0.1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: Align(
                                    child: SvgPicture.asset(
                                      "assets/svg/dashboard/Filter.svg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.022,
                      ),
                      Container(
                        height: 150 / 812 * height,
                        decoration: ShapeDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment(0.99, -0.15),
                            end: Alignment(-0.99, 0.15),
                            colors: [Color(0xFF53E78B), Color(0xFF14BE77)],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: SvgPicture.asset(
                                "assets/svg/dashboard/Pattern.svg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned.fill(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 150 / 375 * width,
                                    child: Image.asset(
                                      "assets/images/png/onion.png",
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      poppinsText(
                                        value: "Special Deal for\nOctober",
                                        size: 17 / 812 * height,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        height: 14 / 812 * height,
                                      ),
                                      Material(
                                        borderRadius: BorderRadius.circular(6),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 10,
                                              horizontal: 20,
                                            ),
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
                                              shadows: const [
                                                BoxShadow(
                                                  color: Color(0x21000000),
                                                  blurRadius: 20,
                                                  offset: Offset(6, 4),
                                                  spreadRadius: 0,
                                                ),
                                              ],
                                            ),
                                            child: Text(
                                              'Buy Now',
                                              style: TextStyle(
                                                color:
                                                    FarmSwapGreen.normalGreen,
                                                fontSize: 10,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w700,
                                                height: 1.31,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25 / 812 * height,
                      ),
                      Row(
                        children: [
                          poppinsText(value: "Nearest Restaurant", size: 15),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: baseText(
                              value: "View More",
                              color: const Color(0xFFFF7C32),
                            ),
                          ),
                        ],
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
