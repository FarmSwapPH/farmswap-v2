import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/colors.dart';
import '../../../constants/typography.dart';

class HorizontalListItem extends StatelessWidget {
  HorizontalListItem({
    super.key,
    required this.width,
    required this.height,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productRating,
    required this.productDistance,
    required this.totalReviews,
    this.promoLabel = "FOR SWAP ONLY",
  });

  final double width;
  final double height;
  final String productName;
  final String productImage;
  final String productPrice;
  final String productRating;
  final String productDistance;
  final String totalReviews;
  String promoLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320 / 375 * width,
      padding: const EdgeInsets.all(6),
      constraints: const BoxConstraints(
        maxWidth: 400,
        maxHeight: 115,
        minWidth: 320,
        minHeight: 65,
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
            offset: Offset(26, 26),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 124 / 375 * width,
            height: 100 / 812 * height,
            constraints: const BoxConstraints(
              maxWidth: 150,
              minWidth: 94,
              minHeight: 65,
            ),
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
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              farmSwapFont(
                text: "8 hours : 12 minutes",
                size: 18 / 812 * height,
                color: FarmSwapGreen.normalGreen,
              ),
              SizedBox(
                height: 10 / 812 * height,
              ),
              SizedBox(
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
        ],
      ),
    );
  }
}
