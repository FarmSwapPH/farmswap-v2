import 'package:farmswap_v2/src/common_widgets/farm_swap_buttons/farmswap_social_button.dart';
import 'package:farmswap_v2/src/common_widgets/input/farmswap_text_field.dart';
import 'package:farmswap_v2/src/constants/typography.dart';
import 'package:farmswap_v2/src/features/authentication/domain/use_cases/login_user.dart';
import 'package:farmswap_v2/src/features/authentication/presentation/forgot_password_screen.dart';
import 'package:farmswap_v2/src/features/dashboard/presentation/dashboard_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common_widgets/farm_swap_buttons/farmswap_primary_button.dart';
import '../../../constants/logo.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email, password;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
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
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 47,
                      right: 89,
                      left: 89,
                      child: Center(
                        child: SvgPicture.asset(logo),
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
                      onPress: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      inputIcon: "assets/svg/auth/Message.svg",
                    ),
                  ),
                  SizedBox(height: height * 0.024),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: FarmSwapTextField(
                      hintText: "Password",
                      onPress: (value) {
                        setState(() {
                          password = value;
                        });
                      },
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
              FarmSwapPrimaryButton(
                isEnabled: true,
                buttonTitle: "Login",
                onPress: () async {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                        email: email!,
                        password: password!,
                      )
                      .then(
                        (value) => {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DasboardScreen(),
                            ),
                          )
                        },
                      );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
