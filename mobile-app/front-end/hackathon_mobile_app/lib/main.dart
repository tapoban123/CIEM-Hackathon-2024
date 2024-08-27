import 'package:flutter/material.dart';
import 'package:hackathon_mobile_app/pages/home_page.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hackathon Mobile App",
      theme: ThemeData.light(),
      home:const HomePage(),
    );
  }
}