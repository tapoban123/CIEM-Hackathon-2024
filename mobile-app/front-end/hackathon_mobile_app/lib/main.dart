import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon_mobile_app/auth/login_screen.dart';
import 'package:hackathon_mobile_app/home_navigation/bottom_navigation_controller.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hackathon Mobile App",
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        textTheme: const TextTheme(
          displaySmall: TextStyle(
            fontFamily: "TripSans",
            fontSize: 12,
            letterSpacing: 1,
          ),
          displayMedium: TextStyle(
            fontFamily: "TripSans",
            fontSize: 16,
            letterSpacing: 1,
          ),
          displayLarge: TextStyle(
            fontFamily: "TripSans",
            fontSize: 24,
            letterSpacing: 0.5,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
