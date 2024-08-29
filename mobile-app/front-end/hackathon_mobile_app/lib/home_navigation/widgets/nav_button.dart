import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData buttonIcon;
  final double iconSize;
  final Color iconColor;
  final bool isProfilePage;

  const NavButton(
      {super.key,
      required this.onTap,
      required this.buttonIcon,
      required this.iconSize,
      required this.iconColor,
      this.isProfilePage = false});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: isProfilePage ? () {} : onTap,
      icon: Icon(
        buttonIcon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}
