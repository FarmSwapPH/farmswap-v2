import 'package:farmswap_v2/src/common_widgets/farm_swap_buttons/farmswap_back_arrow_button.dart';
import 'package:farmswap_v2/src/constants/colors.dart';
import 'package:farmswap_v2/src/features/authentication/presentation/upload_photo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets/farm_swap_buttons/farmswap_primary_button.dart';
import '../../../constants/typography.dart';
import '../../../providers/chosen/chosen_provider.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    var choice = context.read<PaymentChosenProvider>();
    var watchChoice = context.watch<PaymentChosenProvider>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: Stack(
            children: [
              Positioned.fill(
                top: 0,
                right: 0,
                child: SvgPicture.asset(
                  "assets/svg/bio/bio-pattern.svg",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                child: Container(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FarmSwapBackArrowButton(),
                      SizedBox(height: height * 0.024),
                      screenTitle(
                        value: "Payment Method",
                      ),
                      SizedBox(height: height * 0.024),
                      baseText(
                        value:
                            "This data will be displayed in your\naccount profile for security",
                      ),
                      SizedBox(height: height * 0.024),
                      PaymentCard(
                        height: height,
                        width: width,
                        paymentPath: "assets/images/payment badges/gpay.png",
                        isBorder: watchChoice.gpay,
                        onTap: () {
                          choice.setGpay = !choice.gpay;
                        },
                      ),
                      SizedBox(height: height * 0.024),
                      PaymentCard(
                        height: height,
                        width: width,
                        paymentPath: "assets/images/payment badges/gcash.png",
                        isBorder: watchChoice.gcash,
                        onTap: () {
                          choice.setGcash = !choice.gcash;
                        },
                      ),
                      SizedBox(height: height * 0.024),
                      PaymentCard(
                        height: height,
                        width: width,
                        paymentPath: "assets/images/payment badges/maya.png",
                        isBorder: watchChoice.maya,
                        onTap: () {
                          choice.setMaya = !choice.maya;
                        },
                      ),
                      const Spacer(),
                      Center(
                        child: FarmSwapPrimaryButton(
                          isEnabled: watchChoice.maya |
                              watchChoice.gcash |
                              watchChoice.gpay,
                          buttonTitle: "Next",
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const UploadPhotoScreen(),
                              ),
                            );
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

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    super.key,
    required this.height,
    required this.width,
    required this.paymentPath,
    required this.isBorder,
    required this.onTap,
  });

  final double height;
  final double width;
  final String paymentPath;
  final bool isBorder;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1, // Adjust the border width as needed
              color: isBorder
                  ? FarmSwapGreen.normalGreen
                  : Colors.transparent, // Green color
            ),
            borderRadius: BorderRadius.circular(22),
          ),
          child: Container(
            height: height * 0.089,
            width: width,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x115A6CEA),
                  blurRadius: 50,
                  offset: Offset(12, 26),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Image.asset(
                paymentPath,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
