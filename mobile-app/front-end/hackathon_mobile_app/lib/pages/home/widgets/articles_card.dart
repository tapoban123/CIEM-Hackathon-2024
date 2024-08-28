import 'package:flutter/material.dart';
import 'package:hackathon_mobile_app/utils/screen_measurements.dart';

class ArticlesCard extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color cardColor;

  const ArticlesCard({
    super.key,
    required this.text,
    required this.onTap,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: ScreenMeasurements.screenWidth(context) * 0.8,
        margin: const EdgeInsets.only(bottom: 0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15),
          color: cardColor,
        ),
        child: Text(
          text,
          style:
              Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 10),
        ),
      ),
    );
  }
}
