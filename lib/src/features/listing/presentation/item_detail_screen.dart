// ignore_for_file: use_key_in_widget_constructors

import 'package:farmswap_v2/src/common_widgets/farm_swap_buttons/farmswap_back_arrow_button.dart';
import 'package:farmswap_v2/src/common_widgets/farm_swap_buttons/farmswap_generic_button.dart';
import 'package:farmswap_v2/src/common_widgets/farm_swap_buttons/primary_green_buttons.dart';
import 'package:farmswap_v2/src/constants/colors.dart';
import 'package:farmswap_v2/src/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'list_item_card.dart';

class ItemDetailScreen extends StatelessWidget {
  const ItemDetailScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
              Container(
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
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star_rate_rounded,
                                color: FarmSwapOrange.normal,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5 / 375 * width,
                              ),
                              poppinsText(value: "4.8", isBold: true, size: 14),
                              SizedBox(
                                width: 5 / 375 * width,
                              ),
                              poppinsText(
                                value: "(4.8k reviews)",
                                size: 12,
                                color: FarmSwapBlack.light,
                              ),
                              const Spacer(),
                              const Icon(Icons.chevron_right)
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: .3,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: FarmSwapGreen.normalGreen,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5 / 375 * width,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  poppinsText(
                                      value: "24 km", isBold: true, size: 14),
                                  SizedBox(
                                    height: 5 / 812 * height,
                                  ),
                                  Row(
                                    children: [
                                      poppinsText(
                                        value: "Delivery Now |",
                                        size: 12 / 812 * height,
                                        color: FarmSwapBlack.light,
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      SizedBox(
                                        child: Align(
                                          child: SvgPicture.asset(
                                            height: 20,
                                            width: 20,
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
                                        size: 12 / 812 * height,
                                        color: FarmSwapBlack.light,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const Spacer(),
                              const Icon(Icons.chevron_right)
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: .3,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        highlightColor: FarmSwapGreen.lightGreen,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: poppinsText(
                            value:
                                "Most whole Alaskan Red King Crabs get broken down into legs, claws, and lump meat. We offer all of these options as well in our online shop, but there is nothing like getting the whole . . . .",
                            size: 12,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20 / 812 * height,
                    ),
                    FarmSwapSectionTitle(
                      height: height,
                      title: "For You",
                    ),
                    SizedBox(
                      height: 20 / 812 * height,
                    ),
                    Row(
                      children: [
                        ListItemCard(
                          height: height,
                          width: width,
                          productName: "Bisayang Kasoy",
                          productImage: "assets/images/category/kasoy.jpg",
                          productPrice: "₱30.00",
                          productRating: "3.8",
                          productDistance: "7",
                          totalReviews: "412",
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ListItemCard(
                          height: height,
                          width: width,
                          productName: "Chinese Talong",
                          productImage:
                              "assets/images/category/chinese eggplant.jpg",
                          productPrice: "₱125.00",
                          productRating: "4.5",
                          productDistance: "12",
                          totalReviews: "2K",
                        ),
                      ],
                    )
                  ],
                ),
              ),

              // SizedBox(
              //   height: 20 / 812 * height,
              // )
            ],
          ),
        ),
        floatingActionButton: PrimaryGreenButton(
          value: "Swap Now",
          height: height,
          width: width,
        ),
      ),
    );
  }
}
