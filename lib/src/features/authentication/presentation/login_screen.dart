import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmswap_v2/src/common_widgets/farm_swap_buttons/farmswap_social_button.dart';
import 'package:farmswap_v2/src/common_widgets/input/farmswap_text_field.dart';
import 'package:farmswap_v2/src/constants/typography.dart';
import 'package:farmswap_v2/src/features/authentication/presentation/forgot_password_screen.dart';
import 'package:farmswap_v2/src/features/dashboard/presentation/dashboard_screen.dart';
import 'package:farmswap_v2/src/providers/user/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:provider/provider.dart';

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
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final person = await FirebaseAuth.instance.signInWithCredential(credential);

    context.read<UserProvider>().setFirstName =
        person.user!.displayName as String;

    // Once signed in, return the UserCredential
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

    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        )
        .then(
          (value) => {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const DashboardScreen(),
              ),
            )
          },
        )
        .onError(
          (error, stackTrace) => {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => Center(
                child: Text(
                  error.toString(),
                ),
              ),
            ),
          },
        );

    // final loggedinUserID = FirebaseAuth.instance.currentUser;
    // final db = FirebaseFirestore.instance;

    // final customerInstance = db.collection("CustomerUsers");

    // final dataToInsert = <String, dynamic>{
    //   "address": "Danao City, Cebu",
    //   "birthDate": "11/22/1994",
    //   "birthPlace": "Bohol",
    //   "email": loggedinUserID!.email,
    //   "userId": loggedinUserID.uid,
    // };

    // await customerInstance.add(dataToInsert);
  }

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
                      inputIcon: "assets/svg/auth/Message.svg",
                      controller: emailController,
                    ),
                  ),
                  SizedBox(height: height * 0.024),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: FarmSwapTextField(
                      hintText: "Password",
                      controller: passwordController,
                      inputIcon: "assets/svg/auth/Lock.svg",
                      isPassword: true,
                    ),
                  )
                ],
              ),
              SizedBox(height: height * 0.024),
              FarmSwapPrimaryButton(
                isEnabled: true,
                buttonTitle: "Login",
                onPress: () {
                  _signIn();
                },
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FarmSwapSocialButton(
                      logoPath: "assets/images/logo/fb.png",
                      buttonTitle: "Facebook",
                      onPress: () {
                        _signInWithFacebook();
                      },
                    ),
                    const SizedBox(
                      width: 10,
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
            ],
          ),
        ),
      ),
    );
  }
}
