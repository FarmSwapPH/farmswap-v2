import 'package:farmswap_v2/src/features/authentication/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common_widgets/farm_swap_buttons/farmswap_primary_button.dart';
import '../../../constants/typography.dart';

class UploadPhotoScreen extends StatelessWidget {
  const UploadPhotoScreen({super.key});

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
                      screenTitle(value: "Upload Your Photo\nProfile"),
                      SizedBox(height: height * 0.024),
                      baseText(
                        value:
                            "This data will be displayed in your\naccount profile for security",
                      ),
                      SizedBox(height: height * 0.024),
                      CustomPicturePicker(
                        height: height,
                        width: width,
                        imagePath: "assets/svg/upload photo/Gallery.svg",
                        title: 'From Gallery',
                      ),
                      SizedBox(height: height * 0.024),
                      CustomPicturePicker(
                        height: height,
                        width: width,
                        imagePath: "assets/svg/upload photo/camera.svg",
                        title: 'From Camera',
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

class CustomPicturePicker extends StatelessWidget {
  const CustomPicturePicker({
    super.key,
    required this.height,
    required this.width,
    required this.imagePath,
    required this.title,
  });

  final double height;
  final double width;
  final String imagePath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.158,
      width: width,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            imagePath,
          ),
          SizedBox(height: height * 0.024),
          poppinsText(value: title, size: 14),
        ],
      ),
    );
  }
}
