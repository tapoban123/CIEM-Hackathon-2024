import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData buttonIcon;
  final double iconSize;
  final Color iconColor;

  const NavButton({
    super.key,
    required this.onTap,
    required this.buttonIcon,
    required this.iconSize,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        buttonIcon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}
