import 'package:farmswap_v2/src/common_widgets/farm_swap_buttons/farmswap_social_button.dart';
import 'package:farmswap_v2/src/common_widgets/input/farmswap_text_field.dart';
import 'package:farmswap_v2/src/constants/typography.dart';
import 'package:farmswap_v2/src/features/authentication/presentation/forgot_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common_widgets/farm_swap_buttons/farmswap_primary_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.36,
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
              SizedBox(height: height * 0.024),
              Column(
                children: [
                  farmSwapFont(
                      text: "Login To Your Account", size: height * 0.024),
                  SizedBox(height: height * 0.024),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: FarmSwapTextField(
                      hintText: "Email",
                      onPress: () {},
                      inputIcon: "assets/svg/auth/Message.svg",
                    ),
                  ),
                  SizedBox(height: height * 0.024),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: FarmSwapTextField(
                      hintText: "Password",
                      onPress: () {},
                      inputIcon: "assets/svg/auth/Lock.svg",
                      isPassword: true,
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: height * 0.024),
                child: Text(
                  'Or Continue With',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: const Color(0xFF09051C),
                      fontSize: height * 0.014,
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
              SizedBox(height: height * 0.024),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotPasswordScreen(),
                    ),
                  );
                },
                child: Text(
                  'Forgot Your Password?',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: const Color(0xFF53E78B),
                      fontSize: height * 0.014,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationColor: const Color(0xFF53E78B),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.024),
              const FarmSwapPrimaryButton(
                buttonTitle: "Login",
                nextScreen: ForgotPasswordScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
