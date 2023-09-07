import 'package:farmswap_v2/src/constants/colors.dart';
import 'package:flutter/material.dart';

class FarmSwapWhiteButton extends StatelessWidget {
  const FarmSwapWhiteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                // width: 157,
                // height: 57,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 60,
              top: 18,
              child: Text(
                'Buy Now',
                style: TextStyle(
                  color: FarmSwapGreen.normalGreen,
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
