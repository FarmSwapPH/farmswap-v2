import 'package:farmswap_v2/src/features/authentication/presentation/set_location_screen.dart';
import 'package:farmswap_v2/src/features/authentication/presentation/splash_screen.dart';
import 'package:farmswap_v2/src/features/authentication/presentation/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common_widgets/farm_swap_buttons/farmswap_back_arrow_button.dart';
import '../../../common_widgets/farm_swap_buttons/farmswap_primary_button.dart';
import '../../../constants/typography.dart';

class UploadProfilePhotoScreen extends StatelessWidget {
  const UploadProfilePhotoScreen({super.key});

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
                      screenTitle(value: "Upload Your Photo\nProfile"),
                      SizedBox(height: height * 0.024),
                      baseText(
                        value:
                            "This data will be displayed in your\naccount profile for security",
                      ),
                      SizedBox(height: height * 0.024),
                      Center(
                        child: Container(
                          width: 251,
                          height: 260,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://via.placeholder.com/251x260"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Center(
                        child: FarmSwapPrimaryButton(
                          buttonTitle: "Next",
                          nextScreen: SetLocationScreen(),
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
