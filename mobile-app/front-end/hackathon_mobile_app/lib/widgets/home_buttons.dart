import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;

  const HomeButton({
    super.key,
    required this.buttonText,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 120,
        minWidth: 70,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      // width: 100,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 0.5,
            offset: Offset(1.5, 2),
            spreadRadius: 1,
          )
        ],
      ),
      child: Text(
        buttonText,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 10,
        ),
      ),
    );
  }
}
