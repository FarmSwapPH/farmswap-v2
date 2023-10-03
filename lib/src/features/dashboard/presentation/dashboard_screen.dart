import 'package:farmswap_v2/src/constants/colors.dart';
import 'package:farmswap_v2/src/features/authentication/presentation/login_screen.dart';
import 'package:farmswap_v2/src/features/dashboard/presentation/bottom_nav.dart';
import 'package:farmswap_v2/src/features/listing/presentation/item_detail_screen.dart';
import 'package:farmswap_v2/src/providers/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets/input/farmswap_searchbar.dart';
import '../../../constants/typography.dart';
import '../../listing/presentation/list_item_card.dart';
import '../../listing/presentation/list_item_horizontal_cart.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height * 0.024),
                        Row(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const CircleAvatar(
                                  backgroundImage: AssetImage(
                                    "assets/images/png/farmer.png",
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    baseText(
                                      value: "Delivery to",
                                      color: FarmSwapBlack.light,
                                    ),
                                    Row(
                                      children: [
                                        poppinsText(
                                          value: context
                                              .watch<UserProvider>()
                                              .username,
                                          // value: user.email ?? "",
                                          size: 14,
                                          isBold: true,
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down_rounded,
                                          color: FarmSwapGreen.normalGreen,
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            const Spacer(),
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(20, 78, 90,
                                        0.2), // 144E5A with 20% opacity
                                    offset: Offset(11, 28),
                                    blurRadius: 50,
                                  ),
                                ],
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  FirebaseAuth.instance.signOut();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ),
                                  );
                                },
                                child: Align(
                                  child: SvgPicture.asset(
                                    "assets/svg/dashboard/Icon Notification.svg",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.022),
                        SizedBox(
                          width: width,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 267 / 375 * width,
                                child: FarmSwapSearchbar(
                                  onPress: () {},
                                  inputIcon:
                                      "assets/svg/dashboard/Icon Search.svg",
                                ),
                              ),
                              const SizedBox(
                                width: 9,
                              ),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(15),
                                  onTap: () {},
                                  child: Container(
                                    width: 49,
                                    height: 50,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFFF9A84D)
                                          .withOpacity(0.1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Align(
                                      child: SvgPicture.asset(
                                        "assets/svg/dashboard/Filter.svg",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.022,
                        ),
                        Container(
                          height: 150 / 812 * height,
                          decoration: ShapeDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment(0.99, -0.15),
                              end: Alignment(-0.99, 0.15),
                              colors: [Color(0xFF53E78B), Color(0xFF14BE77)],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: SvgPicture.asset(
                                  "assets/svg/dashboard/Pattern.svg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned.fill(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 150 / 375 * width,
                                      child: Image.asset(
                                        "assets/images/png/onion.png",
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        poppinsText(
                                          value: "September Onion\nPromo Now!",
                                          size: 17 / 812 * height,
                                          color: Colors.white,
                                          isBold: true,
                                        ),
                                        SizedBox(
                                          height: 14 / 812 * height,
                                        ),
                                        Material(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          child: InkWell(
                                            onTap: () {},
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 10,
                                                horizontal: 20,
                                              ),
                                              decoration: ShapeDecoration(
                                                color: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6)),
                                                shadows: const [
                                                  BoxShadow(
                                                    color: Color(0x21000000),
                                                    blurRadius: 20,
                                                    offset: Offset(6, 4),
                                                    spreadRadius: 0,
                                                  ),
                                                ],
                                              ),
                                              child: Text(
                                                'Swap Now',
                                                style: TextStyle(
                                                  color:
                                                      FarmSwapGreen.normalGreen,
                                                  fontSize: 12,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.31,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25 / 812 * height,
                        ),
                        CircleCategory(height: height),
                        SizedBox(
                          height: 20 / 812 * height,
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ListItemCard(
                              height: height,
                              width: width,
                              productName: "Chinese Kangkong",
                              productImage: "assets/images/category/pechay.jpg",
                              productPrice: "₱ 50.00",
                              productRating: "4.5",
                              productDistance: "1.2",
                              totalReviews: "20",
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ItemDetailScreen(),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ListItemCard(
                              height: height,
                              width: width,
                              productName: "Green Mango",
                              productImage:
                                  "assets/images/category/green mangoi.jpg",
                              productPrice: "₱ 95.00",
                              productRating: "4.3",
                              productDistance: "5",
                              totalReviews: "1.7K",
                            ),

                            // ),
                          ],
                        ),
                        SizedBox(
                          height: 20 / 812 * height,
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        ),
                        SizedBox(
                          height: 20 / 812 * height,
                        ),
                        FarmSwapSectionTitle(
                          height: height,
                          title: 'Recommended 😍',
                        ),
                        SizedBox(
                          height: 20 / 812 * height,
                        ),
                        ScrollableRecommendedBadges(height: height),
                        SizedBox(
                          height: 20 / 812 * height,
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ListItemCard(
                              height: height,
                              width: width,
                              productName: "Chinese Kangkong",
                              productImage: "assets/images/category/pechay.jpg",
                              productPrice: "₱ 50.00",
                              productRating: "4.5",
                              productDistance: "1.2",
                              totalReviews: "20",
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ListItemCard(
                              height: height,
                              width: width,
                              productName: "Green Mango",
                              productImage:
                                  "assets/images/category/green mangoi.jpg",
                              productPrice: "₱ 95.00",
                              productRating: "4.3",
                              productDistance: "5",
                              totalReviews: "1.7K",
                            ),

                            // ),
                          ],
                        ),
                        SizedBox(
                          height: 20 / 812 * height,
                        ),
                        FarmSwapSectionTitle(
                          height: height,
                          title: 'For Swaps 🤝',
                        ),
                        SizedBox(
                          height: 20 / 812 * height,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              HorizontalListItem(
                                width: width,
                                height: height,
                                productName: "Green Okra",
                                productImage: "assets/images/dummy/okra.jpg",
                                productPrice: "₱ 50.00",
                                productRating: "4.5",
                                productDistance: "1.2",
                                totalReviews: "20",
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              HorizontalListItem(
                                width: width,
                                height: height,
                                productName: "Siling Demonyo",
                                productImage:
                                    "assets/images/category/chili.jpg",
                                productPrice: "₱600.00",
                                productRating: "3.2",
                                productDistance: "0.2",
                                totalReviews: "45",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20 / 812 * height,
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ListItemCard(
                              height: height,
                              width: width,
                              productName: "Chinese Kangkong",
                              productImage: "assets/images/category/pechay.jpg",
                              productPrice: "₱ 50.00",
                              productRating: "4.5",
                              productDistance: "1.2",
                              totalReviews: "20",
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ListItemCard(
                              height: height,
                              width: width,
                              productName: "Green Mango",
                              productImage:
                                  "assets/images/category/green mangoi.jpg",
                              productPrice: "₱ 95.00",
                              productRating: "4.3",
                              productDistance: "5",
                              totalReviews: "1.7K",
                            ),

                            // ),
                          ],
                        ),
                        SizedBox(
                          height: 20 / 812 * height,
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ListItemCard(
                              height: height,
                              width: width,
                              productName: "Chinese Kangkong",
                              productImage: "assets/images/category/pechay.jpg",
                              productPrice: "₱ 50.00",
                              productRating: "4.5",
                              productDistance: "1.2",
                              totalReviews: "20",
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ListItemCard(
                              height: height,
                              width: width,
                              productName: "Green Mango",
                              productImage:
                                  "assets/images/category/green mangoi.jpg",
                              productPrice: "₱ 95.00",
                              productRating: "4.3",
                              productDistance: "5",
                              totalReviews: "1.7K",
                            ),

                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}

class CircleCategory extends StatelessWidget {
  const CircleCategory({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CategoryIcon(
          height: height,
          imagePath: "assets/images/category/pechay.jpg",
          text: "Veggies",
        ),
        SizedBox(
          width: 20 * 812 / height,
        ),
        CategoryIcon(
          height: height,
          imagePath: "assets/images/category/kasoy.jpg",
          text: "Fruits",
        ),
        SizedBox(
          width: 20 * 812 / height,
        ),
        CategoryIcon(
          height: height,
          imagePath: "assets/images/category/chili.jpg",
          text: "Spices",
        ),
        SizedBox(
          width: 20 * 812 / height,
        ),
        CategoryIcon(
          height: height,
          imagePath: "assets/images/category/nuts.jpg",
          text: "Seeds",
        ),
        SizedBox(
          width: 20 * 812 / height,
        ),
      ],
    );
  }
}

class ScrollableRecommendedBadges extends StatelessWidget {
  const ScrollableRecommendedBadges({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          RecommendBadge(
            height: height,
            text: '✅ Fresh',
          ),
          const SizedBox(
            width: 10,
          ),
          OutlinedRecommendBadge(
            height: height,
            text: "✨ Hot Pick",
          ),
          const SizedBox(
            width: 10,
          ),
          OutlinedRecommendBadge(
            height: height,
            text: "🦐 Dried Goods",
          ),
          const SizedBox(
            width: 10,
          ),
          OutlinedRecommendBadge(
            height: height,
            text: "🤩 Highest Rated",
          ),
        ],
      ),
    );
  }
}

class OutlinedRecommendBadge extends StatelessWidget {
  const OutlinedRecommendBadge({
    super.key,
    required this.height,
    required this.text,
  });

  final double height;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 13,
          ),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 0.50,
                color: FarmSwapGreen.normalGreen,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: poppinsText(
            value: text,
            size: 12 / 812 * height,
            color: FarmSwapGreen.normalGreen,
          ),
        ),
      ),
    );
  }
}

class RecommendBadge extends StatelessWidget {
  const RecommendBadge({
    super.key,
    required this.height,
    required this.text,
  });

  final double height;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 13,
          ),
          decoration: ShapeDecoration(
            color: FarmSwapGreen.normalGreen,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: poppinsText(
            value: text,
            size: 12 / 812 * height,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable

class CategoryIcon extends StatelessWidget {
  const CategoryIcon({
    super.key,
    required this.height,
    required this.imagePath,
    required this.text,
  });

  final double height;
  final String imagePath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: FarmSwapGreen.normalGreen,
          radius: 30,
          child: CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage(
              imagePath,
            ),
          ),
        ),
        SizedBox(
          height: 10 / 812 * height,
        ),
        baseText(value: text),
      ],
    );
  }
}
