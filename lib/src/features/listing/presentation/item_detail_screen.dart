import 'package:farmswap_v2/src/common_widgets/farm_swap_buttons/farmswap_back_arrow_button.dart';
import 'package:farmswap_v2/src/common_widgets/farm_swap_buttons/farmswap_generic_button.dart';
import 'package:farmswap_v2/src/constants/colors.dart';
import 'package:farmswap_v2/src/constants/typography.dart';
import 'package:flutter/material.dart';

class ItemDetailScreen extends StatelessWidget {
  const ItemDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          width: width,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(25),
                height: 440 / 812 * height,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/images/listing/item.png",
                    ),
                  ),
                ),
                child: Stack(
                  children: [
                    Row(
                      children: [
                        const FarmSwapBackArrowButton(),
                        const Spacer(),
                        FarmSwapGenericButton(
                          icon: Icon(
                            Icons.shopping_cart,
                            color: FarmSwapGreen.normalGreen,
                          ),
                          bgColor: FarmSwapGreen.normalGreen,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 380 / 812 * height,
                child: Container(
                  padding: const EdgeInsets.all(25),
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10 / 812 * height),
                        child: poppinsText(
                            value: "Fresh Guyabano Green",
                            size: 24,
                            isBold: true),
                      ),
                      SizedBox(
                        height: 10 / 812 * height,
                      ),
                      const Divider(
                        thickness: .3,
                      ),
                      SizedBox(
                        height: 10 / 812 * height,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star_rate_rounded,
                          ),
                        ],
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
