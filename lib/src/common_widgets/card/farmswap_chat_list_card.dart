import 'package:flutter/material.dart';

import '../../constants/typography.dart';

class ChatListCard extends StatelessWidget {
  const ChatListCard({
    super.key,
    required this.height,
    required this.width,
    required this.avatar,
    required this.name,
    required this.lastMessage,
    required this.lastSent,
  });

  final double height;
  final double width;
  final String avatar;
  final String name;
  final String lastMessage;
  final String lastSent;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.089,
      width: width,
      padding: const EdgeInsets.all(10),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              // color: FarmSwapGreen.normalGreen,
              borderRadius: BorderRadius.circular(16),
            ),
            width: 62,
            height: 62,
            child: Align(
              child: Image.asset(avatar),
            ),
          ),
          const SizedBox(
            width: 17,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              poppinsText(
                value: name,
                size: 15 / 812 * height,
                isBold: true,
              ),
              const SizedBox(
                height: 8,
              ),
              poppinsText(
                value: lastMessage,
                size: 14 / 812 * height,
                color: const Color(0xFF3B3B3B),
              ),
            ],
          ),
          const Spacer(),
          poppinsText(
            value: lastSent,
            size: 14 / 812 * height,
            color: const Color(0xFF3B3B3B),
          ),
        ],
      ),
    );
  }
}
