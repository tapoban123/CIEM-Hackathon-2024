import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackathon_mobile_app/auth/login_screen.dart';
import 'package:hackathon_mobile_app/local_database/local_database_service.dart';
import 'package:hackathon_mobile_app/providers/navigation_provider.dart';
import 'package:hackathon_mobile_app/utils/scaffold_key.dart';

class EndDrawer extends ConsumerWidget {
  const EndDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextStyle textStyle = Theme.of(context).textTheme.displaySmall!;

    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      width: 250,
      backgroundColor: const Color(0xff624CAB),
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
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
              height: 30,
            ),
            Text(
              "Resources",
              style: textStyle.copyWith(fontSize: 26),
            ),
            GestureDetector(
              onTap: () {
                ref.read(navigationProvider.notifier).navigateToPage(4);
                ScaffoldKey.scaffoldKey.currentState!.closeEndDrawer();
              },
              child: Text(
                "Courses",
                style: textStyle.copyWith(decoration: TextDecoration.underline),
              ),
            ),
            Text(
              "E-Books",
              style: textStyle.copyWith(decoration: TextDecoration.underline),
            ),
            Text(
              "Articles",
              style: textStyle.copyWith(decoration: TextDecoration.underline),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Settings",
              style: textStyle.copyWith(fontSize: 26),
            ),
            Text(
              "Theme",
              style: textStyle.copyWith(decoration: TextDecoration.underline),
            ),
            Text(
              "Retake the Quiz",
              style: textStyle.copyWith(decoration: TextDecoration.underline),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const LoginScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      final tween = Tween(
                        begin: const Offset(-1, 0),
                        end: Offset.zero,
                      ).chain(
                        CurveTween(curve: Curves.decelerate),
                      );

                      final animationOffset = animation.drive(tween);

                      return SlideTransition(
                        position: animationOffset,
                        child: child,
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 300),
                  ),
                  (route) => false,
                );

                ref
                    .read(localDatabaseServiceProvider.notifier)
                    .storeData(false);
              },
              child: Text(
                "Log Out",
                style: textStyle.copyWith(decoration: TextDecoration.underline),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 20.0,
              ),
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
