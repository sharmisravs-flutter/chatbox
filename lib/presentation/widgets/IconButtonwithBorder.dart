import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Iconbuttonwithborder extends StatelessWidget {
  IconData icon;
  GestureTapCallback onTap;
  Color color;
  Iconbuttonwithborder({
    super.key,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: color, width: 1),
        ),
        padding: EdgeInsets.all(8),
        child: Icon(icon, size: 25, color: color),
      ),
    );
  }
}
