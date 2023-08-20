import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common_widgets/farmswap_primary_button.dart';
import '../../../common_widgets/farmswap_text_field.dart';
import '../../../constants/typography.dart';
import 'splash_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool agreeToTerms = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                  farmSwapFont(text: "Sign Up For Free ", size: 20),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: FarmSwapTextField(
                      hintText: "Username",
                      onPress: () {},
                      inputIcon: "assets/svg/auth/Profile.svg",
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: FarmSwapTextField(
                      hintText: "Email",
                      onPress: () {},
                      inputIcon: "assets/svg/auth/Message.svg",
                    ),
                  ),
                  const SizedBox(height: 20),
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
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    agreeToTerms = !agreeToTerms;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: agreeToTerms == true
                                ? const Color(0xFF53E78B)
                                : Colors.grey,
                          ),
                          color: agreeToTerms == true
                              ? const Color(0xFF53E78B)
                              : Colors.white,
                        ),
                        child: Align(
                          child: SvgPicture.asset("assets/svg/auth/check.svg"),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Agree to terms & conditions",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Color(0xFF3B3B3B),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.50,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const FarmSwapPrimaryButton(
                buttonTitle: "Create Account",
                nextScreen: SplashScreen(),
              ),
              const SizedBox(height: 20),
              Text(
                'Already have an account?',
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
            ],
          ),
        ),
      ),
    );
  }
}
