import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackathon_mobile_app/providers/other_providers.dart';
import 'package:hackathon_mobile_app/utils/scaffold_key.dart';

class CommunityAppBar extends ConsumerWidget {
  const CommunityAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
      top: 60,
      left: 10,
      right: 16,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                ScaffoldKey.scaffoldKey.currentState!.openDrawer();
                ref.read(readOnlyCommunityTextfieldProvider.notifier).update(
                  (state) {
                    state = true;
                    return state;
                  },
                );
              },
              child: SizedBox(
                width: 42,
                height: 42,
                child: SvgPicture.asset(
                  "assets/images/jam_menu.svg",
                  height: 15,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              "COMMUNITY",
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: Colors.white,
                    letterSpacing: 3,
                  ),
            ),
            const Icon(
              Icons.search,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
