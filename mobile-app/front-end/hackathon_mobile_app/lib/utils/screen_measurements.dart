import 'package:flutter/material.dart';

class ScreenMeasurements {
  static screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
}
