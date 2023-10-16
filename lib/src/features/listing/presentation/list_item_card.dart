import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  });

  final String productName;
  final String productImage;
  final String productPrice;
  final String productRating;
  final String productDistance;
  final String totalReviews;
  String promoLabel;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(6.w),
        width: 150.w,
        constraints: BoxConstraints(
          maxWidth: 200.w,
          minWidth: 150.w,
          minHeight: 200.h,
        ),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
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
              height: 120.h,
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
                        borderRadius: BorderRadius.circular(10.r),
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
                        vertical: 2.w,
                        horizontal: 5.h,
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
              height: 10.h,
            ),
            SizedBox(
              width: 96.w,
              child: poppinsText(
                value: productName,
                size: 12.sp,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            poppinsText(
              value: '$productDistance km | ⭐ $productRating ($totalReviews)',
              size: 10.sp,
              color: const Color(0xFF5F5D6B),
            ),
            SizedBox(
              height: 10.sp,
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
                  size: 10.h,
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
      ),
    );
  }
}
