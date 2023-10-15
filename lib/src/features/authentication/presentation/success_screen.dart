import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../main.dart';
import '../../../common_widgets/farm_swap_buttons/farmswap_primary_button.dart';
import '../../dashboard/presentation/dashboard_screen.dart';

// ignore: must_be_immutable
class SuccessScreen extends StatefulWidget {
  SuccessScreen({super.key, this.title, this.subtitle});

  String? title;
  String? subtitle;

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  // void nextScreen() async {
  //   Future.delayed(
  //     const Duration(seconds: 3),
  //     () {
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: ((context) => const DashboardScreen()),
  //         ),
  //       );
  //     },
  //   );
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   nextScreen();
  // }

  Future goToDashboard() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        // User is signed in
        navigatorKey.currentState!.pushReplacement(
          MaterialPageRoute(builder: (context) => const DashboardScreen()),
        );
      } else {
        // User is not signed in
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Incorrect Credentials'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  "assets/svg/success/bg-pattern.svg",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/svg/success/success-icon.svg"),
                      SizedBox(height: 32.h),
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                            colors: [Color(0xFF53E88B), Color(0xFF15BE77)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            tileMode: TileMode.clamp,
                          ).createShader(bounds);
                        },
                        child: Text(
                          widget.title ?? 'Congrats!',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Color(0xFF53E78B),
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              height: 1.31,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        widget.subtitle ?? 'Your Profile Is Ready To Use',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Color(0xFF09041B),
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                            height: 1.31,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 192.h,
                      ),
                      Center(
                        child: FarmSwapPrimaryButton(
                          buttonTitle: "Next",
                          // ignore: unnecessary_null_comparison
                          isEnabled: true,
                          onPress: () {
                            goToDashboard();
                          },
                        ),
                      ),
                    ],
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
