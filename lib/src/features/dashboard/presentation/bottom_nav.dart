import 'package:farmswap_v2/src/constants/typography.dart';
import 'package:farmswap_v2/src/features/chat/presentation/chat_screen.dart';
import 'package:farmswap_v2/src/features/dashboard/presentation/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: 355,
      height: 74,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x195A6CEA),
            blurRadius: 50,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const DashboardScreen()),
              );
            },
            child: const CustomBottomIcon(
              icon: 'assets/svg/bottom nav/Home.svg',
              label: "Home",
            ),
          ),
          const SizedBox(width: 10),
          NoLabelCustomBottomIcon(
            icon: 'assets/svg/bottom nav/Profile.svg',
            onPress: () {},
          ),
          // SizedBox(width: 5),
          NoLabelCustomBottomIcon(
            icon: 'assets/svg/bottom nav/Buy.svg',
            onPress: () {},
          ),
          NoLabelCustomBottomIcon(
            icon: 'assets/svg/bottom nav/Chat.svg',
            onPress: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ChatScreen()));
            },
          ),
        ],
      ),
    );
  }
}

class CustomBottomIcon extends StatelessWidget {
  const CustomBottomIcon({
    super.key,
    required this.icon,
    required this.label,
  });

  final String icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      height: 44,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.99, -0.15),
          end: const Alignment(-0.99, 0.15),
          colors: [
            const Color(0xFF53E78B).withOpacity(0.1),
            const Color(0xFF14BE77).withOpacity(0.1)
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(icon),
          const SizedBox(width: 10),
          poppinsText(value: label, size: 12),
        ],
      ),
    );
  }
}

class NoLabelCustomBottomIcon extends StatelessWidget {
  const NoLabelCustomBottomIcon({
    super.key,
    required this.icon,
    required this.onPress,
  });

  final String icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 50,
        height: 44,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: SizedBox(
          height: 20,
          width: 20,
          child: Align(
            child: SvgPicture.asset(icon),
          ),
        ),
      ),
    );
  }
}
