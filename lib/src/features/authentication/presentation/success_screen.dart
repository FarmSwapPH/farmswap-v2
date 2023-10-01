import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
  void nextScreen() async {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => const DashboardScreen()),
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
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
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
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/svg/success/success-icon.svg"),
                      SizedBox(height: height * 0.04),
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
                      SizedBox(height: height * 0.02),
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
                      )
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
