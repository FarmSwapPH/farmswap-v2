import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/colors.dart';
import '../../../constants/typography.dart';

class ListItemCard extends StatelessWidget {
  ListItemCard({
    super.key,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productRating,
    required this.productDistance,
    required this.totalReviews,
    this.promoLabel = "PROMO",
    this.onTap,
    required this.height,
    required this.width,
  });

  final String productName;
  final String productImage;
  final String productPrice;
  final String productRating;
  final String productDistance;
  final String totalReviews;
  String promoLabel;
  final double height;
  final double width;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        width: 150 / 375 * width,
        constraints: const BoxConstraints(
          maxWidth: 200,
          minWidth: 150,
          minHeight: 200,
        ),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x11000000),
              blurRadius: 50,
              offset: Offset(0, 26),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120 / 812 * height,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            productImage,
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    left: 10,
                    child: Container(
                      // width: 28,
                      // height: 10,
                      padding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 5,
                      ),
                      decoration: ShapeDecoration(
                        color: const Color(0xFF14BE77),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x3FFFFFFF),
                            blurRadius: 40,
                            offset: Offset(15, 20),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: poppinsText(
                        value: promoLabel,
                        size: 8 / 812 * height,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10 / 812 * height,
            ),
            SizedBox(
              width: 96,
              child: poppinsText(
                value: productName,
                size: 12 / 812 * height,
              ),
            ),
            SizedBox(
              height: 10 / 812 * height,
            ),
            poppinsText(
              value: '$productDistance km | ⭐ $productRating ($totalReviews)',
              size: 10 / 812 * height,
              color: const Color(0xFF5F5D6B),
            ),
            SizedBox(
              height: 10 / 812 * height,
            ),
            Row(
              children: [
                poppinsText(
                  value: productPrice,
                  size: 14 / 812 * height,
                  isBold: true,
                  color: FarmSwapGreen.normalGreen,
                ),
                const SizedBox(
                  width: 3,
                ),
                poppinsText(
                  value: "|",
                  size: 10 / 812 * height,
                  color: const Color(0xFF5F5D6B),
                ),
                const SizedBox(
                  width: 3,
                ),
                SizedBox(
                  child: Align(
                    child: SvgPicture.asset(
                      height: 15,
                      width: 15,
                      "assets/svg/dashboard/delivery icon.svg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                poppinsText(
                  value: "₱20.00",
                  size: 10 / 812 * height,
                  color: const Color(0xFF5F5D6B),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
