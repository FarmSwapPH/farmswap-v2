import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              child: SvgPicture.asset(
                "assets/svg/splash_pattern.svg",
                width: 197,
                height: 203,
              ),
            ),
          ),
          Positioned(
            child: Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/Logo.png",
                  width: 197,
                  height: 203,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
