import 'package:farmswap_v2/src/common_widgets/farmswap_social_button.dart';
import 'package:farmswap_v2/src/common_widgets/farmswap_text_field.dart';
import 'package:farmswap_v2/src/features/authentication/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common_widgets/farmswap_primary_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: SvgPicture.asset(
                        "assets/svg/auth/Pattern.svg",
                      ),
                    ),
                    Positioned(
                      top: 47,
                      right: 89,
                      left: 89,
                      child: Center(
                        child: Image.asset("assets/images/Logo.png"),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Text(
                    'Login To Your Account',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Color(0xFF09041B),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const FarmSwapTextField(hintText: "Email"),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const FarmSwapTextField(hintText: "Password"),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Or Continue With',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Color(0xFF09051C),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FarmSwapSocialButton(
                      logoPath: "assets/svg/auth/fb.svg",
                      buttonTitle: "Facebook",
                    ),
                    SizedBox(width: 20),
                    FarmSwapSocialButton(
                      logoPath: "assets/svg/auth/google.svg",
                      buttonTitle: "Google",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Forgot Your Password?',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Color(0xFF53E78B),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.solid,
                    decorationColor: Color(0xFF53E78B),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const FarmSwapPrimaryButton(
                buttonTitle: "Login",
                nextScreen: SplashScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
