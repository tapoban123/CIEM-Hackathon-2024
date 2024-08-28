import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommunityDrawer extends StatelessWidget {
  const CommunityDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      width: 250,
      backgroundColor: const Color(0xffFF7340),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 50,
              height: 50,
              child: SvgPicture.asset(
                "assets/images/jam_menu.svg",
                height: 15,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 80,
              height: 20,
              child: Image.asset(
                "assets/images/Chats.png",
                height: 10,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 110,
              height: 30,
              child: Image.asset(
                "assets/images/Discover.png",
                height: 10,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 90,
              height: 20,
              child: Image.asset(
                "assets/images/Events.png",
                height: 10,
                fit: BoxFit.cover,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: Image.asset(
                "assets/images/logo.png",
                height: 60,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
