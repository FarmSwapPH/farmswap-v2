import 'package:farmswap_v2/src/features/dashboard/presentation/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common_widgets/card/farmswap_chat_list_card.dart';
import '../../../common_widgets/farm_swap_buttons/farmswap_back_arrow_button.dart';
import '../../../constants/typography.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
                        value: "Chat",
                      ),
                      SizedBox(height: height * 0.024),
                      ChatListCard(
                        height: height,
                        width: width,
                        avatar: "assets/images/person.png",
                        lastMessage: 'Padong na ang talong',
                        name: 'Rian Barriga',
                        lastSent: '10 mins',
                      ),
                      SizedBox(height: height * 0.024),
                      ChatListCard(
                        height: height,
                        width: width,
                        avatar: "assets/images/person.png",
                        lastMessage: 'Hala ang manok',
                        name: 'Kriz Ligaray',
                        lastSent: '10 mins',
                      ),
                      SizedBox(height: height * 0.024),
                      ChatListCard(
                        height: height,
                        width: width,
                        avatar: "assets/images/person.png",
                        lastMessage: 'Kuhaa ang baboy guys',
                        name: 'German Abing',
                        lastSent: '10 mins',
                      )
                    ],
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
