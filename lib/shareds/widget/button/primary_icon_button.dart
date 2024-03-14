import 'package:flutter/material.dart';

class PrimaryIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;
  const PrimaryIconButton(
      {super.key, required this.onPressed, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(iconData),
    );
  }
}
