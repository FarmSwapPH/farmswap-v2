import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/colors.dart';
import '../../../constants/typography.dart';

class HorizontalListItem extends StatelessWidget {
  HorizontalListItem({
    super.key,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productRating,
    required this.productDistance,
    required this.totalReviews,
    this.promoLabel = "FOR SWAP ONLY",
  });

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
      width: 320.w,
      padding: const EdgeInsets.all(6).w,
      constraints: BoxConstraints(
        maxWidth: 400.w,
        maxHeight: 115.h,
        minWidth: 320.w,
        minHeight: 65.h,
      ),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10).r,
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
            width: 124.w,
            height: 100.h,
            constraints: BoxConstraints(
              maxWidth: 150.w,
              minWidth: 94.w,
              minHeight: 65.h,
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
                      borderRadius: BorderRadius.circular(10).r,
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 10,
                  child: Container(
                    // width: 28,
                    // height: 10,
                    padding: EdgeInsets.symmetric(
                      vertical: 2.h,
                      horizontal: 5.w,
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
                      size: 8.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              farmSwapFont(
                text: "8 hours : 12 minutes",
                size: 15.sp,
                color: FarmSwapGreen.normalGreen,
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                child: poppinsText(
                  value: productName,
                  size: 12.sp,
                ),
              ),
              SizedBox(
                height: 10.sp,
              ),
              poppinsText(
                value: '$productDistance km | ⭐ $productRating ($totalReviews)',
                size: 10.sp,
                color: const Color(0xFF5F5D6B),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  poppinsText(
                    value: productPrice,
                    size: 14.sp,
                    isBold: true,
                    color: FarmSwapGreen.normalGreen,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  poppinsText(
                    value: "|",
                    size: 10.sp,
                    color: const Color(0xFF5F5D6B),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  SizedBox(
                    child: Align(
                      child: SvgPicture.asset(
                        height: 15.h,
                        width: 15.w,
                        "assets/svg/dashboard/delivery icon.svg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  poppinsText(
                    value: "₱20.00",
                    size: 10.sp,
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
