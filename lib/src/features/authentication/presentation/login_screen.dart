// ignore_for_file: use_build_context_synchronously

import 'package:farmswap_v2/src/common_widgets/farm_swap_buttons/farmswap_social_button.dart';
import 'package:farmswap_v2/src/common_widgets/input/farmswap_text_field.dart';
import 'package:farmswap_v2/src/constants/typography.dart';
import 'package:farmswap_v2/src/features/authentication/presentation/forgot_password_screen.dart';
import 'package:farmswap_v2/src/features/authentication/presentation/register_screen.dart';
import 'package:farmswap_v2/src/features/dashboard/presentation/dashboard_screen.dart';
import 'package:farmswap_v2/src/providers/user/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:provider/provider.dart';

import '../../../../main.dart';
import '../../../common_widgets/farm_swap_buttons/farmswap_primary_button.dart';
import '../../../constants/logo.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isValidEmail(String email) {
    final RegExp regex = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");
    return regex.hasMatch(email);
  }

  Future<UserCredential> _signInWithFacebook() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Future<UserCredential> _signInWithGoogle() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final person = await FirebaseAuth.instance.signInWithCredential(credential);

    context.read<UserProvider>().setFirstName =
        person.user!.displayName as String;

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
    navigatorKey.currentState!.pushReplacement(
      MaterialPageRoute(builder: (context) => const DashboardScreen()),
    );

    return person;
  }

  Future _signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Navigator.pushReplacement(context,
      //     MaterialPageRoute(builder: ((context) => const DashboardScreen())));
    } catch (e) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
          child: Text(
            e.toString(),
          ),
        ),
      );
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
    navigatorKey.currentState!.pushReplacement(
      MaterialPageRoute(builder: (context) => const DashboardScreen()),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
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
              Form(
                key: formKey,
                child: Column(
                  children: [
                    farmSwapFont(text: "Login To Your Account", size: 20.sp),
                    SizedBox(height: 20.h),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      child: FarmSwapTextField(
                        hintText: "Email",
                        inputIcon: "assets/svg/auth/Message.svg",
                        controller: emailController,
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
                      margin: const EdgeInsets.symmetric(horizontal: 20),
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
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          SizedBox(height: 35.h),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Create Account',
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
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPasswordScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Forgot Your Password?',
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
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              FarmSwapPrimaryButton(
                isEnabled: true,
                buttonTitle: "Login",
                onPress: () {
                  if (formKey.currentState!.validate()) {
                    _signIn();
                  }
                },
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.h),
                child: Text(
                  'Or Continue With',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: const Color(0xFF09051C),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FarmSwapSocialButton(
                      logoPath: "assets/images/logo/fb.png",
                      buttonTitle: "Facebook",
                      onPress: () {
                        // _signInWithFacebook();
                      },
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    FarmSwapSocialButton(
                      logoPath: "assets/images/logo/google.png",
                      buttonTitle: "Google",
                      onPress: () {
                        _signInWithGoogle();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
