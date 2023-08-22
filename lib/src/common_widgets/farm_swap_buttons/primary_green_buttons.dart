import 'package:flutter/material.dart';

class PrimaryGreenButton extends StatelessWidget {
  const PrimaryGreenButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 157,
        height: 57,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 157,
                height: 57,
                decoration: ShapeDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment(0.99, -0.15),
                    end: Alignment(-0.99, 0.15),
                    colors: [Color(0xFF53E78B), Color(0xFF14BE77)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 60,
              top: 18,
              child: Text(
                'Hoi Ang Utang',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  height: 1.31,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
