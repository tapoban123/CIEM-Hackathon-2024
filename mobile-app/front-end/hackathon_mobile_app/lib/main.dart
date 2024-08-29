import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon_mobile_app/auth/login_screen.dart';
import 'package:hackathon_mobile_app/home_navigation/bottom_navigation_controller.dart';
import 'package:hackathon_mobile_app/local_database/local_database_service.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();

  final providerContainer = ProviderContainer();

  bool? isAuthenticated = await providerContainer
      .read(localDatabaseServiceProvider.notifier)
      .getData();

  runApp(
    UncontrolledProviderScope(
      container: providerContainer,
      child: MyApp(
        isAuthenticated: isAuthenticated ?? false,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isAuthenticated;

  const MyApp({
    super.key,
    required this.isAuthenticated,
  });

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
      home: isAuthenticated ? BottomNavigationController() : LoginScreen(),
    );
  }
}
