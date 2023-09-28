import 'package:farmswap_v2/src/constants/logo.dart';
import 'package:farmswap_v2/src/features/authentication/domain/use_cases/create_user.dart';
import 'package:farmswap_v2/src/features/authentication/presentation/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common_widgets/farm_swap_buttons/farmswap_primary_button.dart';
import '../../../common_widgets/input/farmswap_text_field.dart';
import '../../../constants/typography.dart';
import '../../dashboard/presentation/dashboard_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool agreeToTerms = false;

  String? username, email, password;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: height,
            width: width,
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
                        text: "Sign Up For Free ", size: height * 0.024),
                    const SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: FarmSwapTextField(
                        hintText: "Username",
                        onPress: (value) {
                          setState(() {
                            username = value;
                          });
                        },
                        inputIcon: "assets/svg/auth/Profile.svg",
                      ),
                    ),
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
                SizedBox(height: height * 0.024),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GestureDetector(
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
                              child:
                                  SvgPicture.asset("assets/svg/auth/check.svg"),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Agree to terms & conditions",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: const Color(0xFF3B3B3B),
                                fontSize: height * 0.0147,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.50,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                FarmSwapPrimaryButton(
                  isEnabled: agreeToTerms,
                  buttonTitle: "Create Account",
                  onPress: () {
                    createUser(email!, password!, username!);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DasboardScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: height * 0.012),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => LoginScreen()),
                      ),
                    );
                  },
                  child: Text(
                    'Already have an account?',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: const Color(0xFF53E78B),
                        fontSize: height * 0.0147,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationColor: const Color(0xFF53E78B),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
