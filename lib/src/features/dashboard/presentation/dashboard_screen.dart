import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmswap_v2/src/constants/colors.dart';
import 'package:farmswap_v2/src/features/authentication/presentation/login_screen.dart';
import 'package:farmswap_v2/src/features/dashboard/presentation/bottom_nav.dart';
import 'package:farmswap_v2/src/features/listing/presentation/item_detail_screen.dart';
import 'package:farmswap_v2/src/features/user/presentation/user_screen.dart';
// import 'package:farmswap_v2/src/providers/user/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:provider/provider.dart';

import '../../../../main.dart';
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
  bool displaySearchBar = false;
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future signOut() async {
    // Get the GoogleSignIn instance.
    final googleSignIn = GoogleSignIn();

    // Sign out the user.
    await googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
  }

  Future fetchUser() async {
    final users = db.collection("CustomerUsers");
    final query = users.where("userId",
        isEqualTo: FirebaseAuth.instance.currentUser!.uid);

    print(query);
  }

  @override
  void initState() {
    // TODO: implement initState
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
    fetchUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Builder(
          builder: (context) => SizedBox(
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
                    padding: const EdgeInsets.all(25).w,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.h),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: FirebaseAuth.instance
                                                  .currentUser!.photoURL !=
                                              null
                                          ? NetworkImage(
                                              FirebaseAuth.instance.currentUser!
                                                  .photoURL as String,
                                            ) as ImageProvider
                                          : const AssetImage(
                                              "assets/images/png/farmer.png"),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        baseText(
                                          value: "Delivery to",
                                          color: FarmSwapBlack.light,
                                        ),
                                        Row(
                                          children: [
                                            poppinsText(
                                              value: FirebaseAuth
                                                      .instance
                                                      .currentUser!
                                                      .displayName ??
                                                  "User",
                                              // value: user.email ?? "",
                                              size: 14.sp,
                                              isBold: true,
                                            ),
                                            SizedBox(
                                              width: 3.w,
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
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Container(
                                    width: 45.w,
                                    height: 45.h,
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
                                        setState(() {
                                          displaySearchBar = !displaySearchBar;
                                        });
                                      },
                                      child: Align(
                                        child: SvgPicture.asset(
                                          "assets/svg/dashboard/Icon Search.svg",
                                          color: FarmSwapGreen.normalGreen,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Container(
                                    width: 45.w,
                                    height: 45.h,
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
                                        signOut();
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
                            ],
                          ),
                          SizedBox(height: 20.h),
                          if (displaySearchBar)
                            SizedBox(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 267.w,
                                    child: FarmSwapSearchbar(
                                      onPress: () {},
                                      inputIcon:
                                          "assets/svg/dashboard/Icon Search.svg",
                                    ),
                                  ),
                                  SizedBox(
                                    width: 9.w,
                                  ),
                                  Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(15),
                                      onTap: () {},
                                      child: Container(
                                        width: 49.w,
                                        height: 50.h,
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFFF9A84D)
                                              .withOpacity(0.1),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15).w,
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
                            height: 20.h,
                          ),
                          Container(
                            height: 150.h,
                            decoration: ShapeDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment(0.99, -0.15),
                                end: Alignment(-0.99, 0.15),
                                colors: [Color(0xFF53E78B), Color(0xFF14BE77)],
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16).r,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 130.w,
                                        child: Image.asset(
                                          "assets/images/png/onion.png",
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          poppinsText(
                                            value:
                                                "September Onion\nPromo Now!",
                                            size: 17.sp,
                                            color: Colors.white,
                                            isBold: true,
                                          ),
                                          SizedBox(
                                            height: 14.h,
                                          ),
                                          Material(
                                            borderRadius:
                                                BorderRadius.circular(6).r,
                                            child: InkWell(
                                              onTap: () {},
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 10.w,
                                                  horizontal: 20.h,
                                                ),
                                                decoration: ShapeDecoration(
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                                  6)
                                                              .r),
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
                                                    color: FarmSwapGreen
                                                        .normalGreen,
                                                    fontSize: 12.sp,
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
                            height: 25.h,
                          ),
                          const CircleCategory(),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ListItemCard(
                                productName: "Chinese Kangkong",
                                productImage:
                                    "assets/images/category/pechay.jpg",
                                productPrice: "₱50.00",
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
                              SizedBox(
                                width: 20.w,
                              ),
                              ListItemCard(
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
                            height: 20.h,
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ListItemCard(
                                productName: "Bisayang Kasoy",
                                productImage:
                                    "assets/images/category/kasoy.jpg",
                                productPrice: "₱30.00",
                                productRating: "3.8",
                                productDistance: "7",
                                totalReviews: "412",
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              ListItemCard(
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
                            height: 20.h,
                          ),
                          const FarmSwapSectionTitle(
                            title: 'Recommended 😍',
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          const ScrollableRecommendedBadges(),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ListItemCard(
                                productName: "Chinese Kangkong",
                                productImage:
                                    "assets/images/category/pechay.jpg",
                                productPrice: "₱ 50.00",
                                productRating: "4.5",
                                productDistance: "1.2",
                                totalReviews: "20",
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              ListItemCard(
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
                            height: 20.h,
                          ),
                          const FarmSwapSectionTitle(
                            title: 'For Swaps 🤝',
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                HorizontalListItem(
                                  productName: "Green Okra",
                                  productImage: "assets/images/dummy/okra.jpg",
                                  productPrice: "₱ 50.00",
                                  productRating: "4.5",
                                  productDistance: "1.2",
                                  totalReviews: "20",
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                HorizontalListItem(
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
                            height: 20.h,
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ListItemCard(
                                productName: "Chinese Kangkong",
                                productImage:
                                    "assets/images/category/pechay.jpg",
                                productPrice: "₱ 50.00",
                                productRating: "4.5",
                                productDistance: "1.2",
                                totalReviews: "20",
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              ListItemCard(
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
                            height: 20.h,
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ListItemCard(
                                productName: "Chinese Kangkong",
                                productImage:
                                    "assets/images/category/pechay.jpg",
                                productPrice: "₱ 50.00",
                                productRating: "4.5",
                                productDistance: "1.2",
                                totalReviews: "20",
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              ListItemCard(
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
      ),
      bottomNavigationBar: const BottomNav(),
      drawer: Drawer(
        backgroundColor: FarmSwapGreen.normalGreen,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 5.h,
            ),
            child: Column(
              children: [
                DrawerHeader(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30.r,
                        backgroundImage: FirebaseAuth
                                    .instance.currentUser!.photoURL !=
                                null
                            ? NetworkImage(
                                FirebaseAuth.instance.currentUser!.photoURL
                                    as String,
                              ) as ImageProvider
                            : const AssetImage("assets/images/png/farmer.png"),
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          poppinsText(
                              value: FirebaseAuth
                                      .instance.currentUser!.displayName ??
                                  "Guest",
                              size: 14.sp,
                              isBold: true,
                              color: Colors.white),
                          SizedBox(height: 5.h),
                          poppinsText(
                              value: FirebaseAuth.instance.currentUser!.email
                                  .toString(),
                              size: 12.sp,
                              color: FarmSwapBlack.normal),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.h),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserAccountScreen(),
                      ),
                    );
                  },
                  child: ListTile(
                    iconColor: Colors.white,
                    leading: const Icon(Icons.person_outline),
                    title: poppinsText(
                      value: "Account",
                      size: 14.sp,
                      color: Colors.white,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
                SizedBox(height: 5.h),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    iconColor: Colors.white,
                    leading: const Icon(Icons.delivery_dining_outlined),
                    title: poppinsText(
                      value: "Orders",
                      size: 14.sp,
                      color: Colors.white,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
                SizedBox(height: 5.h),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    iconColor: Colors.white,
                    leading: const Icon(Icons.payment_outlined),
                    title: poppinsText(
                      value: "Payment Method",
                      size: 14.sp,
                      color: Colors.white,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
                SizedBox(height: 5.h),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    iconColor: Colors.white,
                    leading: const Icon(Icons.location_on_outlined),
                    title: poppinsText(
                      value: "Address",
                      size: 14.sp,
                      color: Colors.white,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
                SizedBox(height: 5.h),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    iconColor: Colors.white,
                    leading: const Icon(Icons.shield_outlined),
                    title: poppinsText(
                      value: "Security",
                      size: 14.sp,
                      color: Colors.white,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () async {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                    signOut();
                    navigatorKey.currentState!
                        .popUntil((route) => route.isFirst);
                    navigatorKey.currentState!.pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  child: ListTile(
                    iconColor: Colors.white,
                    leading: const Icon(Icons.logout),
                    title: poppinsText(
                      value: "Logout",
                      size: 14.sp,
                      color: Colors.white,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CircleCategory extends StatelessWidget {
  const CircleCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CategoryIcon(
          imagePath: "assets/images/category/pechay.jpg",
          text: "Veggies",
        ),
        SizedBox(
          width: 20.w,
        ),
        const CategoryIcon(
          imagePath: "assets/images/category/kasoy.jpg",
          text: "Fruits",
        ),
        SizedBox(
          width: 20.w,
        ),
        const CategoryIcon(
          imagePath: "assets/images/category/chili.jpg",
          text: "Spices",
        ),
        SizedBox(
          width: 20.w,
        ),
        const CategoryIcon(
          imagePath: "assets/images/category/nuts.jpg",
          text: "Seeds",
        ),
        SizedBox(
          width: 20.w,
        ),
      ],
    );
  }
}

class ScrollableRecommendedBadges extends StatelessWidget {
  const ScrollableRecommendedBadges({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const RecommendBadge(
            text: '✅ Fresh',
          ),
          SizedBox(
            width: 10.w,
          ),
          const OutlinedRecommendBadge(
            text: "✨ Hot Pick",
          ),
          SizedBox(
            width: 10.w,
          ),
          const OutlinedRecommendBadge(
            text: "🦐 Dried Goods",
          ),
          SizedBox(
            width: 10.h,
          ),
          const OutlinedRecommendBadge(
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
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 5.h,
            horizontal: 13.w,
          ),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 0.50.w,
                color: FarmSwapGreen.normalGreen,
              ),
              borderRadius: BorderRadius.circular(20).r,
            ),
          ),
          child: poppinsText(
            value: text,
            size: 12.sp,
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
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 5.h,
            horizontal: 13.w,
          ),
          decoration: ShapeDecoration(
            color: FarmSwapGreen.normalGreen,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20).r,
            ),
          ),
          child: poppinsText(
            value: text,
            size: 12.sp,
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
    required this.imagePath,
    required this.text,
  });

  final String imagePath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: FarmSwapGreen.normalGreen,
          radius: 30.r,
          child: CircleAvatar(
            radius: 28.r,
            backgroundImage: AssetImage(
              imagePath,
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        baseText(value: text),
      ],
    );
  }
}
