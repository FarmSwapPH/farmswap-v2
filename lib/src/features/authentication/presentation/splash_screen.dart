import 'package:farmswap_v2/src/constants/colors.dart';
import 'package:farmswap_v2/src/constants/logo.dart';
import 'package:farmswap_v2/src/features/authentication/presentation/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void nextScreen() async {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => const RegisterScreen()),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    nextScreen();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
                // width: 197,
                // height: 203,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            child: Center(
              child: SizedBox(
                child: SvgPicture.asset(
                  logo,
                  width: 197,
                  height: 203,
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CircularProgressIndicator(
                color: Color(0xFF53E88B),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
