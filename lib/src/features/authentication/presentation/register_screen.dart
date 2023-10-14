import 'package:farmswap_v2/src/constants/logo.dart';
import 'package:farmswap_v2/src/features/authentication/presentation/bio_screen.dart';
import 'package:farmswap_v2/src/features/authentication/presentation/login_screen.dart';
import 'package:farmswap_v2/src/providers/user/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../main.dart';
import '../../../common_widgets/farm_swap_buttons/farmswap_primary_button.dart';
import '../../../common_widgets/input/farmswap_text_field.dart';
import '../../../constants/typography.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool agreeToTerms = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isValidUsername(String username) {
    final RegExp regex = RegExp(r"^[a-zA-Z0-9_]{5,15}$");
    return regex.hasMatch(username);
  }

  bool isValidEmail(String email) {
    final RegExp regex = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");
    return regex.hasMatch(email);
  }

  bool isValidPassword(String password) {
    final RegExp regex = RegExp(
        r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");
    return regex.hasMatch(password);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void initializeUser() {
      var user = context.read<UserProvider>();
      user.setUsername = usernameController.text.trim();
      user.setEmail = emailController.text.trim();
      user.setPassword = passwordController.text.trim();
    }

    Future createUser() async {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );

      initializeUser();

      // navigatorKey.currentState!.popUntil((route) => route.isFirst);

      navigatorKey.currentState!.pushReplacement(
        MaterialPageRoute(builder: (context) => const BioScreen()),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 292.h,
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
                  SizedBox(height: 20.h),
                  Column(
                    children: [
                      farmSwapFont(text: "Sign Up For Free ", size: 20.h),
                      const SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        child: FarmSwapTextField(
                          hintText: "Username",
                          controller: usernameController,
                          inputIcon: "assets/svg/auth/Profile.svg",
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter a value';
                            } else if (value.length < 3) {
                              return 'Value must be at least 3 characters long';
                            } else if (!isValidUsername(
                                usernameController.text.trim())) {
                              return 'Not a valid username';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        child: FarmSwapTextField(
                          hintText: "Email",
                          controller: emailController,
                          inputIcon: "assets/svg/auth/Message.svg",
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter a value';
                            } else if (value.length < 5) {
                              return 'Value must be at least 5 characters long';
                            } else if (!isValidEmail(
                                emailController.text.trim())) {
                              return 'This is an invalid email!';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        child: FarmSwapTextField(
                          hintText: "Password",
                          controller: passwordController,
                          inputIcon: "assets/svg/auth/Lock.svg",
                          isPassword: true,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter a value';
                            } else if (value.length < 5) {
                              return 'Value must be at least 5 characters long';
                            } else if (!isValidPassword(
                                passwordController.text.trim())) {
                              return "Weak Password! You can do better than that.";
                            } else {
                              return null;
                            }
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          agreeToTerms = !agreeToTerms;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.r),
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
                                child: SvgPicture.asset(
                                    "assets/svg/auth/check.svg"),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              "Agree to terms & conditions",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: const Color(0xFF3B3B3B),
                                  fontSize: 11.sp,
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
                  SizedBox(height: 20.h),
                  FarmSwapPrimaryButton(
                    isEnabled: agreeToTerms,
                    buttonTitle: "Create Account",
                    onPress: () {
                      if (formKey.currentState!.validate()) {
                        createUser();
                      }
                    },
                  ),
                  SizedBox(height: 10.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const LoginScreen()),
                        ),
                      );
                    },
                    child: Text(
                      'Already have an account?',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: const Color(0xFF53E78B),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          // decoration: TextDecoration.underline,
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
      ),
    );
  }
}
