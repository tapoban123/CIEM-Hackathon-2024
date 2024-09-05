import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon_mobile_app/home_navigation/bottom_navigation_controller.dart';
import 'package:hackathon_mobile_app/providers/local_database_auth_provider/local_database_service_provider.dart';
import 'package:hackathon_mobile_app/theme/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void navigateToHome(WidgetRef ref) {
    ref.read(localDatabaseServiceProvider.notifier).storeData(true);

    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const BottomNavigationController(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final tween = Tween(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).chain(
            CurveTween(curve: Curves.decelerate),
          );
          final position = animation.drive(tween);

          return SlideTransition(
            position: position,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              "assets/images/Home.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 220,
            left: 50,
            child: Container(
              width: 300,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(6.5, 6.5),
                    // blurRadius: 4,
                    spreadRadius: 3,
                  ),
                ],
                color: const Color(0xff25C3DB),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Text(
                    "Login",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 50),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 3,
                            ),
                            SizedBox(
                              width: 240,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  fillColor: CustomColors.whiteColor,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  hintText: "Enter passkey",
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          color: CustomColors.darkTextColor
                                              .withOpacity(0.5)),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  suffixIcon: Consumer(
                                    builder: (context, ref, child) {
                                      return IconButton(
                                        onPressed: () => navigateToHome(ref),
                                        icon: const Icon(Icons.arrow_forward),
                                        color: CustomColors.darkTextColor,
                                      );
                                    },
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                      color: CustomColors.darkTextColor,
                                      decoration: TextDecoration.none,
                                    ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            RichText(
                              text: TextSpan(
                                text: "Don't have a passkey?\n",
                                style: Theme.of(context).textTheme.displaySmall,
                                children: [
                                  const TextSpan(
                                    text: "Create a profile on",
                                  ),
                                  TextSpan(
                                    text: " Xplore ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall!
                                        .copyWith(
                                          color: CustomColors.darkTextColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  const TextSpan(
                                    text: "first.",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
